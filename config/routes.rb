Rails.application.routes.draw do
  resources :packs
  resources :teams
  resources :npcs
  resources :pokemons
  resources :users :only [:new, :show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
