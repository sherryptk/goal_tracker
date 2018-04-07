Rails.application.routes.draw do

  devise_for :users, :controllers => { :omniauth_callbacks => 'sessions#create' }
  root 'welcome#index', as: 'root'

  get 'welcome/home', as: 'welcome'


  # resources :items, only: [:show, :index]
  # resources :categories, only: [:show, :index]
  # resources :users, only: [:show]
  # resources :carts
  # resources :line_items, only: [:create]
  # resources :orders, only: [:show]
  #
  # post 'carts/:id/checkout', to: 'carts#checkout', as: 'checkout'

end
