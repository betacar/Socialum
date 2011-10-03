ActionController::Routing::Routes.draw do |map|
  map.root :controller => 'overview'
  
  map.resources :transportes

  map.resources :tipo_transportes

  map.resources :subprocesos

  map.resources :procesos

  map.resources :buques

  map.resources :equipos

  map.resources :alarmas

  map.resources :stock_gabarras

  map.resources :estatus_gabarras

  map.resources :locacions

  map.resources :tipo_materias

  map.resources :arribos

  map.resources :descargar

  map.resources :novedades

  map.devise_for :users

  map.devise_for :users, :path_names => { :sign_in => 'login', :sign_out => 'logout' }
  
  map.user_root '/overview', :controller => 'overview'

  # The priority is based upon order of creation: first created -> highest priority.

  # Sample of regular route:
  #   map.connect 'products/:id', :controller => 'catalog', :action => 'view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   map.purchase 'products/:id/purchase', :controller => 'catalog', :action => 'purchase'
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   map.resources :products

  # Sample resource route with options:
  #   map.resources :products, :member => { :short => :get, :toggle => :post }, :collection => { :sold => :get }

  # Sample resource route with sub-resources:
  #   map.resources :products, :has_many => [ :comments, :sales ], :has_one => :seller
  
  # Sample resource route with more complex sub-resources
  #   map.resources :products do |products|
  #     products.resources :comments
  #     products.resources :sales, :collection => { :recent => :get }
  #   end

  # Sample resource route within a namespace:
  #   map.namespace :admin do |admin|
  #     # Directs /admin/products/* to Admin::ProductsController (app/controllers/admin/products_controller.rb)
  #     admin.resources :products
  #   end

  # You can have the root of your site routed with map.root -- just remember to delete public/index.html.
  # map.root :controller => "welcome"

  # See how all your routes lay out with "rake routes"

  # Install the default routes as the lowest priority.
  # Note: These default routes make all actions in every controller accessible via GET requests. You should
  # consider removing or commenting them out if you're using named routes and resources.
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'

  # Ruta para reportar arribos de Bax
  map.connect 'arribos/:action/:num_zarpe/:anio_zarpe',
              :controller => 'arribos',
              :action => 'reportar',
              :num_zarpe => /\d{3}/,
              :anio_zarpe => /\d{4}/

  # Ruta para cargar en el view las gabarras del BAX
  map.connect 'arribos/:action/:num_zarpe/:anio_zarpe',
              :controller => 'arribos',
              :action => 'gabarras',
              :num_zarpe => /\d{3}/,
              :anio_zarpe => /\d{4}/
  
  # Ruta para dialogos de descarga de gabarra de un Bax
  map.arribos_gabarra 'arribos/:action/:num_zarpe/:anio_zarpe/:gabarra_id', 
              :controller => 'arribos',
              :action => 'gabarra',
              :num_zarpe => /\d{3}/,
              :anio_zarpe => /\d{4}/,
              :gabarra_id => /(\w{2,5})-(\d{3,4}|\w{4})/
  
  # Ruta para subir los valores de descarga de gabarras de un Bax  
  map.connect 'descargar/:action/:num_zarpe/:anio_zarpe/:gabarra_id', 
              :controller => 'descargar',
              :action => 'gabarra',
              :num_zarpe => /\d{3}/,
              :anio_zarpe => /\d{4}/,
              :gabarra_id => /(\w{2,5})-(\d{3,4}|\w{4})/
  
  # Ruta para subir los valores de descarga de gabarras de un Bax, con formato
  map.connect 'descargar/:action/:num_zarpe/:anio_zarpe/:gabarra_id.:format', 
              :controller => 'descargar',
              :action => 'gabarra',
              :num_zarpe => /\d{3}/,
              :anio_zarpe => /\d{4}/,
              :gabarra_id => /(\w{2,5})-(\d{3,4}|\w{4})/
  
  # Ruta para subir los valores de descarga de un buque
  map.connect 'descargar/:action/:tipo_materia_id/:buque_id',
              :controller => 'descargar',
              :action => 'buque',
              :tipo_materia_id => /\d{1,}/,
              :buque_id => /\d{1,}/
end