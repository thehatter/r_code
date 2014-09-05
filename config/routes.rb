RCode::Application.routes.draw do


  mount Ckeditor::Engine => '/ckeditor'

  devise_for :users

  class OwnDomain
    def self.matches?(request)
      # request.subdomain != "www" && request.host = 'r-code-main.com'   #!~ /localhost|\.local|hostname\.com/
      (request.domain.present? && request.domain != "r-code-main.com") || request.subdomain.present? && request.subdomain != "www" #{"snowboarding.by"}
    end
  end



  constraints(OwnDomain) do
    get '/' => 'pages#front'
    resources :pages
    resources :menus
    resources :catalogs
    resources :categories do
      post :sort, on: :collection
    end
    resources :catalog_items do
      post :sort, on: :collection
    end
    resources :menu_items do
      post :sort, on: :collection
    end
  end



  root to: "welcome#index"

  resources :sites, path: '/admin/sites'
  get "admin/list_for_add_owner", to: "sub_owners#list_for_add_owner"
  get "admin/add_owner", to: "sub_owners#add_owner"

  resources :line_items
  resources :carts
  resources :orders
  # resources :pages, except: :show

  # class OwnDomain
  #   def self.matches?(request)
  #     request.subdomain != "www" && request.host != 'r_code_main.com'   #!~ /localhost|\.local|hostname\.com/
  #   end
  # end

  # constraints(OwnDomain) do
  #   get '/' => 'pages#front'
  #   get '/:id' => 'pages#show'
  # end

  # get 'pages/:id', to: 'pages#show', as: :show_page


  # root to: "welcome#index"

  # resources :sites, path: '/admin/sites'





  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'sites#show'

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
