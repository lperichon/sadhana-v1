Sadhana::Application.routes.draw do |map|
  match '/auth/:provider/callback' => 'authentications#create'
  devise_for :admins, :path_names => { :sign_out => "logout" }
  devise_for :users, :controllers => { :registrations => "users/registrations", :invitations => "users/invitations", :confirmations => "users/confirmations", :sessions => "users/sessions" }

  ActiveAdmin.routes(self)

  resources :sign_in_as

  resources :authentications

  resources :parts

  resources :techniques

  resources :contacts do
    collection do
      get :select
    end
  end

  resources :facebook_contacts
  resources :external_contacts

  resources :practice_events

  resources :practices do
    member do
      get :play
    end
    resource :practice_publications
    resources :practice_shares
    resources :practice_parts do
      collection do
        post :sort
      end
      resources :practice_techniques do
      collection do
        post :sort
      end
    end
    end
  end

  resources :subscriptions do
    member do
      get :credit_card
      get :history
      post :store_credit_card
      post :unstore_credit_card
      get :cancel
    end
  end

  root :to => 'high_voltage/pages#show', :id => 'home'

  match 'practices' => 'practices#index', :as => :user_root

  match 'payments/paypal_ipn' => 'payments#paypal_ipn', :as => :paypal_ipn
  match 'payments/stripe_webhook' => 'payments#stripe_webhook', :as => :stripe_webhook

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
  #       get :short
  #       post :toggle
  #     end
  #
  #     collection do
  #       get :sold
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
  #       get :recent, :on => :collection
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

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
