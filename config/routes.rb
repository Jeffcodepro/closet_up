Rails.application.routes.draw do
  devise_for :users
  root to: "products#index"

  get "up" => "rails/health#show", as: :rails_health_check

  # Produtos
  get "/products", to: "products#index", as: :products
  get "/products/new", to: "products#new", as: :new_product
  post "/products", to: "products#create"
  get "/products/:id", to: "products#show", as: :product
  get "/products/:id/edit", to: "products#edit", as: :edit_product
  patch "/products/:id", to: "products#update"
  delete "/products/:id", to: "products#destroy", as: :delete_product

  # Orders
  resources :products do
    resources :orders, only: [:show, :create], shallow: true
  end

  resources :orders, only: [:index]

  # Payments
  resources :orders, only: [:show, :create] do
    resources :payments, only: :new
  end

  # Filtro por categoria
  get "/products/category/:category_id", to: "products#index", as: :products_by_category

  # Ofertas
  get "/products/:product_id/offers/new", to: "offers#new", as: :new_product_offer
  post "/products/:product_id/offers", to: "offers#create", as: :product_offers
  get "/offers", to: "offers#index", as: :offers
  get "/offers/:id", to: "offers#show", as: :offer

end
