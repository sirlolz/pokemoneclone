Rails.application.routes.draw do
  resources :battles
  resources :packs
  resources :teams
  resources :npcs
  resources :pokemons
  resources :users
  resources :sessions, only:[:new, :create]
  
  post 'logout' => 'sessions#destroy'
  root 'sessions#new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # get 'battles/:id/attack', to: 'battles#attack'
  patch 'battles/:id/attack', to: 'battles#attack'
end
