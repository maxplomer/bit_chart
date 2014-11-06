FinanceClone::Application.routes.draw do
  get "static_pages/home"

  resources :users, :only => [:create, :new, :show, :edit, :update, :index] do 
    resources :trades, :only => [:create]
    resources :recent_quotes, :only => [:create]
    resources :notifications, :only => [:create, :destroy]
    #resources :notification_messages, :only => [:index] #not using anymore
    resources :follows, :only => [:create, :destroy, :index]
  end
  resource :session, :only => [:create, :destroy, :new]

  resources :companies, :only => [:show]
  
  resources :recent_quotes, :only => [:create]

  root :to => "sessions#new"

  get "static_pages/backbone"
  
  namespace :api, :defaults => { :format => :json } do
    resources :companies, :only => [:show, :index]
    resources :users, :only => [:show, :index]
    resources :trades, :only => [:show, :index, :create]
    resources :notifications, :only => [:show, :index, :create]
    resources :follows, :only => [:show, :index, :create, :destroy]
    resources :recent_quotes, :only => [:show, :index, :create]
  end
end








  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
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

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end