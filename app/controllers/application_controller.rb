class ApplicationController < ActionController::Base
    before_action :setup_auth

    def setup_auth
        @current_user = User.find_by(id: session[:user_id])
    end

    def authorized
        unless !!@current_user
            flash[:errors]= ["Login please!"]
            return redirect_to '/login'
        end
    end


end
