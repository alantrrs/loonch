GroceryApp::Application.routes.draw do
  
  #resources :carts, :only => [:new, :create, :update, :checkout]
  resources :sessions, :only => [:create, :destroy]
  resources :users, :only => [:show, :update, :create, :destroy]
  resources :categories, :only => [:show]
  resources :loonches, :only => [:show, :new, :create]
  root :to => 'pages#welcome'

  match '/home', :to => 'pages#home'

  match '/contact', :to => 'pages#contact'

  match '/about', :to => 'pages#about'

  match '/blog', :to => 'pages#blog'
  
  match '/signout', :to => 'sessions#destroy'
  
  match '/browse', :to => 'categories#index'
 match '/create_cart', :to => 'carts#new'
 match '/add_to_cart', :to => 'carts#update'	
 match '/checkout', :to => 'carts#checkout'
 match '/buy_with', :to => 'carts#buy_with'
 
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
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
