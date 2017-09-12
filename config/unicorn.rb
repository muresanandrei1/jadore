deploy_to = "/home/deployer/jadore"
root = "#{deploy_to}/current"
working_directory root
pid "#{deploy_to}/shared/pids/unicorn.pid"
stderr_path "#{deploy_to}/shared/log/unicorn.log"
stdout_path "#{deploy_to}/shared/log/unicorn.log"

listen "/tmp/unicorn.jadore.sock"
worker_processes 1
preload_app true
timeout 30

# Force the bundler gemfile environment variable to
before_exec do |_|
 ENV["BUNDLE_GEMFILE"] = File.join(root, 'Gemfile')
end
