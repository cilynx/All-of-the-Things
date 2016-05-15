Rails.application.routes.draw do
  resources :tasks
  resources :houses
  resources :performed_maintenances
  resources :performed_maintenance_parts
  resources :parts
  resources :services
  resources :maintenances
  resources :maintenance_schedules
  post 'maintenance_schedules/import' => 'maintenance_schedules#import', as: :import_maintenance_schedule
  resources :canonical_vehicles
  resources :steps
  resources :fillups
  resources :vehicles
  get 'vehicles/:id/image' => 'vehicles#image', as: :vehicle_image
  post 'vehicles/:id/fillup' => 'vehicles#fillup', as: :vehicle_fillup
  post 'vehicles/:id/import' => 'vehicles#import', as: :import_vehicle_fillups
  resources :aliases
  resources :transactions
  resources :vendors
  resources :accounts
  post 'accounts/:id/import' => 'accounts#import', as: :import_account_transactions
  resources :checking_accounts, controller: 'accounts', type: 'CheckingAccount'
  resources :stock_accounts, controller: 'accounts', type: 'StockAccount'
  get 'welcome/index'

  devise_for :users
  resources :users, :only => [:show]

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'welcome#index'


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
