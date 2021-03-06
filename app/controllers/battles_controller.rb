class BattlesController < ApplicationController
    def index
        
    end

    def new
        @battle = Battle.new
    end

    def create
        if Battle.create(user_id: current_user_id, npc_id: params[:battle][:npc_id]).valid?
            battle = Battle.create(user_id: current_user_id, npc_id: params[:battle][:npc_id])
            redirect_to battle_path(battle)
        else
            redirect_to '/battles/new'
        end
    end

    def show
        @battle = Battle.find(params[:id])
    end

    def attack
        battle = Battle.find(params[:id])
        battle.fight

        if battle.alive
            redirect_to battle_path(battle)
        elsif battle.win
            battle.reset_stats
            render plain: "you win"
        elsif battle.lose
            battle.reset_stats
            render plain: "you lose"
        end
    end

end
