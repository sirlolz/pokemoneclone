class SessionsController < ApplicationController
    skip_before_action :login, only: [:new, :create]
    
    def new
    end

    def create        
        if !params[:name] || params[:name].empty?
            redirect_to controller: 'sessions', action: 'new'
        else
            user = User.find_by(name: params[:name])

            if user
                session[:id] = user.id
                redirect_to user_path(user)
            else
                redirect_to new_user_path
            end
        end
    end

    def destroy
        session.delete(:id)
        redirect_to root_path
    end
end
