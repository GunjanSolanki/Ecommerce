Rails.application.routes.draw do
  get 'home/index'
  devise_for :users, :controllers => { registrations: 'registrations',
    omniauth_callbacks: "users/omniauth_callbacks" }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :products
  resources :orders, only: [:index, :create, :show, :destroy]
  resources :shopping_carts, only: [:index] do
    member do
      get 'product/:product_id/add_to_cart', to: 'shopping_carts#add_to_cart', as: 'add_to'
      delete 'product/:product_id/remove_from_cart', to: 'shopping_carts#destroy', as: 'remove_from'
    end
  end

  root to: 'home#index'

  get 'user/:id/orders', to: 'orders#show_user_orders', as: 'user_orders'
  
  scope '/admin' do
    get 'products', to: 'products#index', as: 'admin_products'
    get 'pending_orders', to: 'orders#index', as: 'admin_pending_order'
    get 'orders', to: 'orders#show', as: 'admin_orders'
    get 'confirm_order/:id', to: 'orders#confirm_order', as: 'admin_confirm_order'
  end

  devise_scope :user do
    get "signup", to: "devise/registrations#new"
    get "login", to: "devise/sessions#new"
    get "logout", to: "devise/sessions#destroy"
  end
end