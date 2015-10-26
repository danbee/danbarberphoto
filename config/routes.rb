require 'monban/constraints/signed_in'
require 'monban/constraints/signed_out'

DanBarberPhoto::Application.routes.draw do
  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create]
  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create]

  namespace :admin do
    DashboardManifest::DASHBOARDS.each do |dashboard_resource|
      resources dashboard_resource
    end

    root controller: DashboardManifest::ROOT_DASHBOARD, action: :index
  end

  resources :contacts

  resources :categories do
    resources :photos do
      member do
        post :log_view
      end
    end
  end

  resources :photos do
    member do
      post :log_view
    end
  end

  resources :contacts, only: [:new, :create]

  get '/:name' => 'pages#show', as: :page
  root to: 'home#index'
end
