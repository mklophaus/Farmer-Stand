Rails.application.routes.draw do

  # page home
  root 'welcome#index'
  get '/home', to: 'welcome#index'

  # user routes for both purchasers and farmers
  resources :users,      only: [:index, :new, :create, :edit, :update]

  # resources :farmers, only: [:update], controller: 'users', as: 'users'

  # login/logout authentication
  resources :sessions, only: [:new, :create, :destroy]
  get '/login', to: 'sessions#new'

  # other resources

  resources :orders

  resources :products


end
