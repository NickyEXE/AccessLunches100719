class AuthController < ApplicationController

    def new

    end

    def create
        strong_params = params.require(:user).permit(:username, :password)
        user = User.find_by(username: strong_params[:username])
        if user && user.authenticate(strong_params["password"])
            session[:user_id] = user.id
            redirect_to restaurants_path
        else
            flash[:errors] = ["Invalid username or password"]
            redirect_to login_path
        end
    end
end
