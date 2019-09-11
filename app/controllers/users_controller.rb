class UsersController < ApplicationController

    def index
        @users = User.all
    end

    def show
        @user = User.find(params[:id])
        @user_pokemon = @user.pokemons
    end

    def new
        @user = User.new
    end

    def create
        @user = User.new(name: params[:user][:name])

        if @user.save
            session[:user_id] = @user.id
            team_instance = Team.create(user: @user, pokemon: Pokemon.find(params[:user][:pokemon_ids]))
            team_instance.update(hp: team_instance.pokemon.hp)
            redirect_to user_path(@user)
        else
            render :new
        end
    end

    def edit
        @user = User.find(params[:id])
    end

    def update
        @user = User.find(params[:id])
        if @user.update(user_params)
            session[:user_id] = @user.id
            @user.teams.destroy_all
            Team.create(user: @user, pokemon: Pokemon.find(params[:user][:pokemon_ids]))
            redirect_to user_path(@user)
        else
            render :edit
        end
    end

    def destroy
        @user = User.find(params[:id]).destroy
        redirect_to users_path
    end

    private
        def user_params
            user_params = params.require(:user).permit(:name, :pokemon_id)
        end
end