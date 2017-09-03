Rails.application.routes.draw do
  devise_for :admins

  root 'main#index'

  resources :rooms

  resources :pools do
    get 'delete', on: :collection
    post 'destroy_pictures', on: :collection
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
