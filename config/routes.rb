Jdrampage::Application.routes.draw do
  resources :free_spaces, :only => :show

	resources :articles, :only => :show, :has_many => :comments
	resources :sections, :only => :show
	resources :pages, :only => :show
	resources :subscribers, :only => [ :new, :create ]

	resource :user_session

	namespace :admin do
		resources :users
		resources :articles, :except => :show do
			collection { post 'sort' }
			collection { post 'sort_in_section' }
		end
		resources :sections do
			collection { post 'sort' }
		end
		resources :pages, :except => :show do
		  collection { post 'sort' }
    end
		resources :subscribers, :except => [ :show, :new, :create ]
	  resources :free_spaces, :except => [ :new, :create ]
#		resources :comments
	end

  # Use e.g. <%= link_to 'Admin place', admin_path %>
	match 'staff' => 'static#staff'
	match 'admin' => 'static#admin_home'
	match 'search' => 'static#search_page'
	match 'logout' => 'user_sessions#destroy'

	# match ':controller(/:action(/:id(.:format)))'
	root :to => 'static#home'

	# NOTES BELOW - - - - - - -

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

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end

