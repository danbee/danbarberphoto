require 'monban/constraints/signed_in'
require 'monban/constraints/signed_out'

DanBarberPhoto::Application.routes.draw do
  namespace :admin do
    resources :categories
    resources :pages
    resources :photos
    resources :users

    root to: "categories#index"
  end

  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create]
  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create]

  resources :contacts

  resources :categories do
    resources :photos do
      member do
        post :log_view
      end
    end
  end

  resources :photos do
    resources :views, only: [:create]
  end

  resources :contacts, only: [:new, :create]

  get '/:name' => 'pages#show', as: :page
  root to: 'home#index'
end
