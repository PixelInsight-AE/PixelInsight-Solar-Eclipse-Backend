Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html



  #users
  post '/users', to: 'users#create'
  get '/users', to: 'users#index'
  
  
  #cards
  post '/cards', to: 'cards#create'
  get '/cards', to: 'cards#index'
  get '/cards/:id', to: 'cards#show'
  get '/card_of_the_day', to: 'cards#card_of_the_day'


  #sessions


end
