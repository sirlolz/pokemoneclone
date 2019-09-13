class PokemonsController < ApplicationController
    skip_before_action :login, only: [:show, :index]

    def index 
        @pokemons = Pokemon.all
    end
    def show
        @pokemon = Pokemon.find(params[:id])
    end

end
