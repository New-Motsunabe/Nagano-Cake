Rails.application.routes.draw do



  # scope module: :public do
  # namespace :public do
  #   devise_for :customers
  # end


  # devise_scope :customer do
  #   get 'customers/registrations/edit' => 'public/customers/registrations#edit'
  #   patch 'customers/registrations' => 'public/customers/registrations#update'
  #   put 'customers/registrations' => 'public/customers/registrations#update'
  #   delete 'customers/registrations' => 'public/customers/registrations#destroy'
  # end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  devise_for :admin, :controllers => {
    :registrations => 'admin/registrations',
    :sessions => 'admin/sessions'
  }

  # scope module: :public do
  # namespace :public do
  #   devise_for :customers
  # end
  devise_for :customers, :controllers => {
    :registrations => 'public/customers/registrations',
    :sessions => 'public/customers/sessions'
  }

  # devise_scope :customer do
  #   get 'customers/registrations/edit' => 'public/customers/registrations#edit'
  #   patch 'customers/registrations' => 'public/customers/registrations#update'
  #   put 'customers/registrations' => 'public/customers/registrations#update'
  #   delete 'customers/registrations' => 'public/customers/registrations#destroy'
  # end
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


  scope module: :public do
    resource :customers
    resources :products
    delete "cart_items/destroy_all" => "cart_items#destroy_all", as: "cart_items_destroy_all"
    resources :cart_items, only: [:index, :update, :create, :destroy]
    resources :ordered_products
  end



  get "customers/unsubscribe" => "public/customers#unsubscribe"
  patch "customers/withdraw" => "public/customers#withdraw"
  post "customers/withdraw" => "public/customers#withdraw"




  get "orders/new" => "public/orders#new"
  post 'orders/complete' => "public/orders#complete"
  get "orders" => "public/orders#index"
  get "orders/:id" => "public/orders#show"
  post "orders" => "public/orders#create"
  post "orders/confirm" => "public/orders#confirm"


  get "customers/my_page" => "public/customers#show"

  root to: "public/homes#top"
  get "/about" => "public/homes#about"


  get "/admin" => "admin/homes#top"

get "shipping_addresses" => "public/shipping_addresses#index"
post "shipping_addresses" => "public/shipping_addresses#create"
get "shipping_addresses/:id/edit" => "public/shipping_addresses#edit"
patch "shipping_addresses/:id" => "public/shipping_addresses#update"
delete "shipping_addresses/:id" => "public/shipping_addresses#destroy"


end