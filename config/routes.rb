require 'json'
require 'sinatra'

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      # get '/snails/:id', to: 'snails#show', as: 'snail', param: :name
      resources :users, only: [:create, :update, :destroy]
      post '/login', to: 'sessions#create'
      get '/auto_login', to: 'sessions#auto_login'
      get '/user_auth', to: "sessions#user_auth"
      delete '/logout', to: 'sessions#destroy'
      get '/profile', to: 'users#profile'
      resources :cryptos
      resources :transactions

      post '/create_checkout_session', to: 'wallets#create_checkout_session'
    
    end
  end

end
