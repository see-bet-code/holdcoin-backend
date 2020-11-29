Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      # get '/snails/:id', to: 'snails#show', as: 'snail', param: :name
      resources :users, only: [:create]
      post '/login', to: 'sessions#create'
      get '/profile', to: 'users#profile'
      resources :cryptos
      resources :transactions
    end
  end

end
