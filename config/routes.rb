Rails.application.routes.draw do

  # page home
  root 'welcome#index'
  get '/home', to: 'welcome#index'

  # user routes for both purchasers and farmers
  #resources :products, only: [:index]


  resources :products

  resources :orders, only: [:index, :new, :show, :create]

  resources :users, shallow: true do
    resources :orders
    resources :products
  end
  # resources :farmers, only: [:update], controller: 'users', as: 'users'

  # login/logout authentication
  resources :sessions, only: [:new, :create, :destroy]
  get '/login', to: 'sessions#new'

  get '/cart', to: 'sessions#shopping_cart'
  # other resources

  post '/shopping_cart', to: 'sessions#shopping_cart'

end
