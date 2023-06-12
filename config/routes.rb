Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  post '/tictactoeboards/click', to: 'tictactoeboards#click'
  post '/tictactoeboards/reset', to: 'tictactoeboards#reset'
  get '/tictactoeboards/index', to: 'tictactoeboards#index'
  root "tictactoeboards#index"
end
