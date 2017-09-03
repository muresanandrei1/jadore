Rails.application.routes.draw do
  devise_for :admins

  root 'main#index'

  resources :rooms

  resources :pool, only: ['index']

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
