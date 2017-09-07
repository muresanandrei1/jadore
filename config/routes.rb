Rails.application.routes.draw do
  devise_for :admins

  root 'main#index'

  resources :rooms

  resources :pools do
    get 'delete', on: :collection
    post 'destroy_pictures', on: :collection
  end

  resources :events do
    get 'delete', on: :collection
    post 'destroy_pictures', on: :collection
  end

  resources :restaurants do
    get 'delete', on: :collection
    post 'destroy_pictures', on: :collection
  end

  match '/contacts', to: 'contacts#new', via: 'get'
  
  resources "contacts", only: [:new, :create]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
