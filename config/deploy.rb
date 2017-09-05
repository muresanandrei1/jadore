# config/deploy.rb
require 'mina/bundler'
require 'mina/rails'
require 'mina/git'
require 'mina/rbenv'

set :domain, '188.213.20.95'
set :deploy_to, '/home/deployer/jadore'
set :app_path,   "#{deploy_to}/#{current_path}"
set :repository, 'git@github.com:muresanandrei1/jadore.git'
set :branch, 'master'

set :shared_paths, ['log', '.rbenv-vars']
set :user, 'deploy'
set :forward_agent, true
set :ssh_options, '-A'
set :term_mode, nil

task :environment do
  invoke :'rbenv:load'
end

task :setup => :environment do
  queue! %[mkdir -p "#{deploy_to}/#{shared_path}/log"]
  queue! %[chmod g+rx,u+rwx "#{deploy_to}/#{shared_path}/log"]

  queue! %[mkdir -p "#{deploy_to}/#{shared_path}/config"]
  queue! %[chmod g+rx,u+rwx "#{deploy_to}/#{shared_path}/config"]

  queue! %[touch "#{deploy_to}/#{shared_path}/.rbenv-vars"]
  queue! %[touch "#{deploy_to}/#{shared_path}/config/database.yml"]
  queue! %[touch "#{deploy_to}/#{shared_path}/config/secrets.yml"]
  queue  %[echo "-----> Be sure to edit '#{deploy_to}/#{shared_path}/config/database.yml' and 'secrets.yml'."]

  if repository
	repo_host = repository.split(%r{@|://}).last.split(%r{:|\/}).first
	repo_port = /:([0-9]+)/.match(repository) && /:([0-9]+)/.match(repository)[1] || '22'

	queue %[
  	if ! ssh-keygen -H  -F #{repo_host} &>/dev/null; then
    	ssh-keyscan -t rsa -p #{repo_port} -H #{repo_host} >> ~/.ssh/known_hosts
  	fi
	]
  end
end

desc "Deploys the current version to the server."
task :deploy => :environment do
  to :before_hook do
	# Put things to run locally before ssh
  end

  deploy do
	invoke :'git:clone'
	invoke :'deploy:link_shared_paths'
	invoke :'bundle:install'
	invoke :'rails:db_migrate'
	invoke :'rails:assets_precompile'
	invoke :'deploy:cleanup'

	to :launch do
  	queue "mkdir -p #{deploy_to}/#{current_path}/tmp/"
  	queue "touch #{deploy_to}/#{current_path}/tmp/restart.txt"
  	invoke :'unicorn:stop'
  	invoke :'unicorn:start'
	end
  end
end

namespace :unicorn do
  set :unicorn_pid, "#{deploy_to}/shared/pids/unicorn.pid"
  set :start_unicorn, %{
	cd #{app_path}
	bundle exec unicorn -c #{app_path}/config/unicorn.rb -E #{rails_env} -D
  }

  desc "Start unicorn"
  task :start => :environment do
	queue 'echo "-----> Start Unicorn"'
	queue! start_unicorn
  end

  desc "Stop unicorn"
  task :stop do
	queue 'echo "-----> Stop Unicorn"'
	queue! %{
  	test -s "#{unicorn_pid}" && kill -QUIT `cat "#{unicorn_pid}"` && echo "Stop Ok" && exit 0
  	echo >&2 "Not running"
	}
  end

  desc "Restart unicorn using 'upgrade'"
  task :restart => :environment do
	invoke 'unicorn:stop'
	invoke 'unicorn:start'
  end
end
