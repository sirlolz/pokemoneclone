class NpcsController < ApplicationController
    def index
    end

    def show
        @npc = Npc.all.find(params[:id])
    end

    def new
        @npc = Npc.new
    end

    def create
        @npc = Npc.new(name: params[:npc][:name])
        if @npc.save
            Pack.create(npc: @npc, pokemon: Pokemon.find(params[:npc][:pokemon_ids]))
            redirect_to npc_path(Npc.all.last)
        else
            render :new
        end
    end

    def destroy
        npc = Npc.find(params[:id])
        npc.destroy
        redirect_to npcs_path
    end

    def edit
        @npc = Npc.find(params[:id])
    end

    def update
        @npc = Npc.find(params[:id])
        @npc.update(name: params[:npc][:name])
        @npc.packs.destroy_all
        Pack.create(npc: @npc, pokemon: Pokemon.find(params[:npc][:pokemon_ids]))
        redirect_to npc_path(@npc)
    end

end