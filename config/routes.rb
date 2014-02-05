SamplePro::Application.routes.draw do
  devise_for :admins, :controllers => { :sessions => "admins/session" }
  get "login/index"
  get "posts/new"
  get "chat/online_users"
  post "posts" => "posts#create"
  get "posts/:id" => "posts#show"
  get "posts" => "posts#index"
  get "chat" => "chat#index"
  post "chat" => "chat#create"
  post "check" => "login#check"
  get "register" => "login#register"
  post "create" => "login#create"
  get "index"=>"login#index"
  get "login"=>"login#login"
  get "billing/billing"
  post "billing/save"
  get "billing/add_bill_detail"
  get "billing/load_quantity"
  get "billing/view_bill"
  get "billing/reconsilation"
  post "billing/edit_reconsilation"
  get "billing/add_batch"
  post "billing/save_reconsilation"
  get "billing/search_for_return_bill"
  post "billing/return_bill"
  post "billing/save_return_bill"
  get "billing/update_existing_stock"
  get "item/new"
  post "item/save"
  get "item/list"
  get "item/edit"
  post "item/update"
  
  match 'admins' => 'admins/session#new', :as => 'admin_root'
  match "admins/sign_out", :to => "admins/session#destroy"
  match "/admins/sign_up", :to => "admins/session#new"
  get "news/index"
  get "news/new"
  post "news/save"
  get "news/view_news"
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
   root :to => "login#login"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
