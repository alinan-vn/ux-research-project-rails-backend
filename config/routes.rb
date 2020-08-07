Rails.application.routes.draw do
  resources :shopping_carts
  resources :purchase_orders
  resources :buyers
  resources :bookmarked_services
  resources :services
  resources :bookmarked_products
  resources :products
  resources :sellers
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
