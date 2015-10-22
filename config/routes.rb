DanBarberPhoto::Application.routes.draw do
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
