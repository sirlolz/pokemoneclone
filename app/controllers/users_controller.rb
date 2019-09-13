class UsersController < ApplicationController
    before_action :login
    skip_before_action :login, only: [:new, :create]

    def index
        @users = User.all
    end

    def show
        @user = User.find(current_user_id)
        @user_pokemon = @user.pokemons
    end

    def new
        @user = User.new
    end

    def create
        @user = User.new(name: params[:user][:name])
        
        if @user.save
            team_instance = Team.create(user: @user, pokemon: Pokemon.find(params[:user][:pokemon_ids]))
            team_instance.update(hp: team_instance.pokemon.hp)
            session[:id] = @user.id

            redirect_to user_path(current_user_id)
        else
            # redirect_to new_user_path
            render :new
        end
    end

    def edit
        @user = User.find(session[:id])
    end

    def update
        @user = User.find(current_user_id])
        if @user.update(user_params)
            @user.teams.destroy_all
            team_insace = Team.create(user: @user, pokemon: Pokemon.find(params[:user][:pokemon_ids]))
            team_instance.update(hp: team_instance.pokemon.hp)
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