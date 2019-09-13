class ApplicationController < ActionController::Base
    before_action :login

    def current_user_id
        session[:id]
    end

    private
        def login
            redirect_to root_path unless current_user_id
        end
end
