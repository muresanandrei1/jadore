Rails.application.routes.draw do
  devise_for :admins

  as :admin do
    get '/admin', to: 'devise/sessions#new'
  end

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

  resources :testimonials

  resources :restaurants do
    get 'delete', on: :collection
    post 'destroy_pictures', on: :collection
  end

  match '/contacts', to: 'contacts#new', via: 'get'

  match '/piscina', to: 'pools#index', via: 'get'

  match '/evenimente', to: 'events#index', via: 'get'
  

  resources "contacts", only: [:new, :create]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
