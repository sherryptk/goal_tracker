Rails.application.routes.draw do

  devise_for :users, :controllers => { :omniauth_callbacks => 'sessions#create' }

  root 'welcome#index', as: 'root'

  get 'welcome/home', as: 'welcome'

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  resources :goals
  resources :categories, only: [:show, :index, :create]
  # resources :users, only: [:show]
  # resources :carts
  # resources :line_items, only: [:create]
  # resources :orders, only: [:show]
  #
  # post 'carts/:id/checkout', to: 'carts#checkout', as: 'checkout'

end
