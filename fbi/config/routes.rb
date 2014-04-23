# -*- encoding : utf-8 -*-
Library::Application.routes.draw do



  resources :examinations do
    member do
     get :comment
    end
  end

  resources :digital_data

  resources :numerical_data

  resources :graphic_data

  resources :globals do
    member do
      get :fordigitaldata
      get :img1
      get :img2
    end
  end

  resources :sectors do
    member do
      get :fordigitaldata
    end
  end

  resources :correlations do
    member do
      get :fordigitaldata
    end
  end

  resources :integrals do
    member do
      get :fordigitaldata
      get :img1
      get :img2
    end
  end

  resources :currents do
    member do
      get :fordigitaldata
      get :img1
      get :img2
      get :img3
    end
  end

  resources :localisations do
    member do
      get :fordigitaldata
      get :img1
      get :img2
      get :img3
      get :equal
      get :equal2
    end
  end


  resources :archives

  resources :patients do
    member do
      get :download_archive
      get :addarchive
      get :un_archive
    end
   end


  resources :users
  resources :sessions
  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #match 'logout' => 'sessions#destroy', :as => :logout
  #match 'addarchive' => 'patients#addarchive', :as => :addarchive
  #match 'fordigitaldata' => 'localisations#fordigitaldata', :as => :fordigitaldata
  #match 'un_archive' => 'patients#un_archive', :as => :un_archive
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
   root :to => 'patients#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
