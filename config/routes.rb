Rails.application.routes.draw do
  resources :battles
  resources :packs
  resources :teams
  resources :npcs
  resources :pokemons
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/users/:id/battle', to: 'users#battle'
end
