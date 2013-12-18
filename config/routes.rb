Storysmoker::Application.routes.draw do

  get 'unlock_all' => "stories#unlock_all", :as => :unlock_all

  resources :authentications

  #user management
  resources :user_sessions
  get 'login' => 'user_sessions#new', :as => :login
  post 'logout' => "user_sessions#destroy", :as => :logout
  resources :users

  #tags
post 'tagged' => 'posts#tagged', :as => 'tagged'
get 'tagged' =>  'stories#findByTag'


get "welcome/refresh"
  get "unlock" => "snippets#unlock", as: :unlock

  get 'setStatusAsEditable/:id' => "stories#setStatusAsEditable", as: :setStatusAsEditable

  #get "welcome/index"
  #resources :posts
  get "home" => "welcome#index", as: :home

  resources :stories do
   resources :snippets
  end
  
  root to: "welcome#index"
  
   
  

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
end
