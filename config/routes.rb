Sadhana::Application.routes.draw do |map|
  devise_for :admins
  devise_for :users, :controllers => { :registrations => "users/registrations" }

  resources :techniques

  resources :contacts

  resources :practice_events

  resources :practices do
    member do
      get :play
    end
    resources :practice_techniques do
      collection do
        post :sort 
      end
    end
    resources :practice_parts
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

  namespace :admin do
    resources :parts
    resources :subscription_plans
    resources :subscriptions
    resources :technique_types
    resources :techniques do
      collection do
        get :csv_import
        post :do_csv_import
      end
    end
  end

  root :to => 'high_voltage/pages#show', :id => 'home'

  match 'practices' => 'practices#index', :as => :user_root

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
