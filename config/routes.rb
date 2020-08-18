Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :service_orders
  resources :product_orders
  resources :purchase_orders
  resources :buyers
  resources :bookmarked_services
  resources :services
  resources :bookmarked_products
  resources :products
  resources :sellers

  # Auth routes
  post '/auth_buyer', to: 'auth#create_buyer'
  get '/current_buyer', to: 'auth#show_buyer'

  post '/auth_seller', to: 'auth#create_seller'
  get '/current_seller', to: 'auth#show_seller'

  # resources :shopping_carts
end


# post '/auth', to: 'auth#create'
# get '/current_user', to: 'auth#show'