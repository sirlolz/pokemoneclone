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
        user_damage = battle.user.teams.first.pokemon.att
        npc_damage = battle.npc.packs.first.pokemon.att
        user_hp = battle.user.teams.first
        npc_hp = battle.npc.packs.first
        user_hp.update(hp: user_hp.hp -= npc_damage)
        npc_hp.update(hp: npc_hp.hp -= user_damage)
        redirect_to battle_path(battle)
    end
end
