Dtsmom::Application.routes.draw do
  #resources :updates

  #resources :orders

  devise_for :clients

  devise_for :admins

  match '/dtsadmin' => 'dtsadmin#index', :via => "get"
  match '/dtsadmin/addclient' => 'dtsadmin#addclient', :via => "post"
  match '/dtsadmin/client/:id' => 'dtsadmin#listclient', :as => :dtsadmin_client, :via => "get"
  match '/dtsadmin/client/:clientid/addorder' => 'dtsadmin#addorder', :via => "post", :as => :dtsadmin_addorder
  match '/dtsadmin/client/:clientid/delorder' => 'dtsadmin#delorder', :via => "post", :as => :dtsadmin_delorder
  match '/dtsadmin/client/:clientid/updateorder' => 'dtsadmin#updateorder', :via => "post", :as => :dtsadmin_updateorder
  match '/dtsadmin/client/:clientid/:orderid/additem' => 'dtsadmin#additem', :via => "post", :as => :dtsadmin_additem
  match '/dtsadmin/client/:clientid/:orderid/updateitem' => 'dtsadmin#updateitem', :via => "post", :as => :dtsadmin_updateitem
  match '/dtsadmin/client/:clientid/:orderid/delitem' => 'dtsadmin#delitem', :via => "post", :as => :dtsadmin_delitem
  match '/dtsadmin/password' => 'dtsadmin#changepwdview', :via => "get", :as => :dtsadmin_password_view
  match '/dtsadmin/password' => 'dtsadmin#changepwd', :via => "post", :as => :dtsadmin_password_change

  root :to => 'home#index'

  match '/password' => 'home#changepwdview', :via => "get", :as => :client_password_view
  match '/password' => 'home#changepwd', :via => "post", :as => :client_password_change
  match '/email_updates' => 'home#changeemailstatus', :via => "post", :as => :email_updates

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
  # match ':controller(/:action(/:id))(.:format)'
end
