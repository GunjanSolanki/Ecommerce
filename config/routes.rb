Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, only: [:create]
  resources :sessions, only: [:create]
  resources :products, only: [:index, :new, :create, :destroy]

  root 'users#index'

  get 'admin/products', to: 'products#index', as: 'admin_products'
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  delete 'logout', to: 'sessions#destroy', as: 'logout'
end