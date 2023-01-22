Rails.application.routes.draw do
  resources :posts
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get '/me', to: 'users#show'
  # get "/me", to: "users#show"
  post '/login', to: 'sessions#create' 
  # post "/login", to: "sessions#create"
  delete '/logout', to: 'sessions#destroy'
  # delete "/logout", to: "sessions#destroy"
end
