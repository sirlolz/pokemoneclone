class NpcsController < ApplicationController
    def index
    end

    def show
        @npc = Npc.all.find(params[:id])
    end

    def new
    end

    def create
    end

    def destroy
    end

    def edit
    end

    def update

    end

end