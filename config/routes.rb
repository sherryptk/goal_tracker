Rails.application.routes.draw do

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  get '/users/auth/:provider/callback', to: 'sessions#create'

  root 'welcome#index', as: 'root'

  get 'welcome/home', as: 'welcome'

  get 'tasks/by_date', as: 'by_date'

  post '/tasks/complete', as: 'complete'

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  resources :goals do
    resources :tasks
  end

  resources :tasks

  resources :categories, only: [:show, :index, :create]

end
