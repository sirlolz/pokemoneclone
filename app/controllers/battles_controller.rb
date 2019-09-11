class BattlesController < ApplicationController

    def index
    end
    def new
        @battle = Battle.new
    end
    def create
        battle = Battle.create(user_id: params[:battle][:user_id], npc_id: params[:battle][:npc_id])
        redirect_to battle_path(battle)
    end
    def show
        @battle = Battle.find(params[:id])
    end

    def attack
        battle = Battle.find(params[:id])
        battle.fight
        redirect_to battle_path(battle)
    end
end
