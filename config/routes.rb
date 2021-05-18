Rails.application.routes.draw do

  devise_for :admins

  # scope module: :public do
  # namespace :public do
  #   devise_for :customers
  # end
  devise_for :customers, :controllers => {
    :registrations => 'public/customers/registrations',
    :sessions => 'public/customers/sessions'
  }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :admin do
      resources :customers
      resources :products
      resources :cart_items
      resources :orders
      resources :shipping_addresses
      resources :genres
      resources :ordered_products
  end

  resources :customers
  resources :products
  resources :cart_items
  resources :orders
  resources :shipping_addresses
  resources :genres
  resources :ordered_products

  get "customers/unsubscribe" => "public/customers#unsubscribe"
  patch "customers/withdraw" => "public/customers#withdraw"

  delete "cart_items/destroy_all" => "public/cart_items#destroy_all"

  post "orders/confirm" => "public/orders#confirm"
  get "orders/complete" => "public/orders#complete"

  get "customers/my_page" => "public/customers#show"

  root to: "public/homes#top"
  get "/about" => "public/homes#about"
  
  

end
