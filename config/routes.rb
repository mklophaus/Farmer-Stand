Rails.application.routes.draw do

  root 'welcome#index'
  resources :users, only: [:index, :new, :create]
  resources :sessions, only: [:new, :create, :destroy]
  resources :farmers, only: [:index, :new, :create]
  resources :products, only: [:index, :new, :create, :destroy]

  get '/login', to: 'sessions#new'

  get '/home', to: 'welcome#index'

  get '/farmers', to: 'farmers#index'

  get '/user', to: 'users#index'

  get '/pick', to: 'welcome#new'
end
