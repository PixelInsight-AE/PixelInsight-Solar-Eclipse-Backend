Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html



  #users
  post '/users', to: 'users#create'
  
  
  #cards
  post '/cards', to: 'cards#create'
  get '/cards', to: 'cards#index'


  #sessions


end
