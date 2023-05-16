Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html



  #users
  post '/users', to: 'users#create'
  get '/users', to: 'users#index'
  
  #tarot_decks

  get '/tarot_deck', to: 'tarots#index'
  get '/tarot_deck/:id', to: 'tarots#show'
  post '/tarot_deck', to: 'tarots#create'
  get '/random_card', to: 'tarots#random_card'

  
  #cards
  post '/cards', to: 'cards#create_user_card'
  get '/cards', to: 'cards#index'
  get '/cards/:id', to: 'cards#show'
  get '/card_of_the_day', to: 'cards#card_of_the_day'
  get '/users/:username/cards', to: 'cards#index_user_cards'

  #sessions
  post '/sessions', to: 'sessions#create'
  get '/authenticated', to: 'sessions#authenticated'
  delete '/sessions', to: 'sessions#destroy'


end
