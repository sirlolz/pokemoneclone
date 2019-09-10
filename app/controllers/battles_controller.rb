class BattlesController < ApplicationController
    def index
    end
    def new
        @battle = Battle.new
    end
    def create
        Battle.create(user_id: params[:battle][:user_id], npc_id: params[:battle][:npc_id])
        redirect_to battles_path
    end
end
