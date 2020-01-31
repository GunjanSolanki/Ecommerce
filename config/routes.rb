Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, only: [:create]
  resources :sessions, only: [:create]
  resources :products
  resources :shopping_carts, only: [:index] 

  root 'users#index'

  get 'admin/products', to: 'products#index', as: 'admin_products'
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  delete 'logout', to: 'sessions#destroy', as: 'logout'
  get 'product/add_to_cart/:id', to: 'shopping_carts#add_to_cart', as: 'add_to_cart'
  delete 'product/remove_from_cart/:id', to: 'shopping_carts#destroy', as: 'remove_from_cart'
end