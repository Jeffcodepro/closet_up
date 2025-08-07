Rails.application.routes.draw do
  get 'offers/index'
  get 'offers/show'
  get 'offers/new'
  get 'offers/create'
  get 'products/index'
  get 'products/show'
  devise_for :users
  root to: "products#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"

  get "/products", to: "products#index", as: :products

  get "/products/new", to: "products#new", as: :new_product

  post "/products", to: "products#create"

  get "/products/:id", to: "products#show", as: :product

  # Filtro por categoria
  get '/products/category/:category_id', to: 'products#index', as: :products_by_category

  # Criar nova oferta para um produto específico
  get  '/products/:product_id/offers/new', to: 'offers#new', as: :new_product_offer
  post '/products/:product_id/offers',     to: 'offers#create', as: :product_offers

  # Listar todas as ofertas
  get '/offers', to: 'offers#index', as: :offers

  # Ver uma oferta específica
  get '/offers/:id', to: 'offers#show', as: :offer

end
