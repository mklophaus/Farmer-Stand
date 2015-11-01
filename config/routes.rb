Rails.application.routes.draw do

  root 'welcome#index'
  resources :users, only: [:new, :create]
  resources :sessions, only: [:new, :create]

  get '/login', to: 'sessions#new'


end
