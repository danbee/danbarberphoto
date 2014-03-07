DanBarberPhoto::Application.routes.draw do
  resources :contacts

  as :admin_user do
    match '/admin_users/confirmation' => 'admin/confirmations#update', via: :put, as: :update_user_confirmation
  end

  devise_for :admin_users, controllers: {
    sessions: "admin/sessions",
    passwords: "admin/passwords",
    #registrations: "admin/registrations",
    confirmations: "admin/confirmations",
    unlocks: "admin/unlocks"
  }

  namespace :admin do
    root to: "dashboard#index", as: :dashboard
    resources :admin_users
    resource :admin_user do
      member do
        get :edit_password
        put :update_password
      end
    end
    resources :categories
    resources :photos
    resources :pages
  end

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => "welcome#index"

  # See how all your routes lay out with "rake routes"

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

  #match 'contact' => 'pages#contact', :as => :contact
  resources :contacts, only: [:new, :create]

  match '/:name' => 'pages#show', as: :page, via: :get

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'

  # root :to => 'welcome#index'
  root to: 'home#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
