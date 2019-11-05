class AuthController < ApplicationController

    def new

    end

    def create
        strong_params = params.require(:user).permit(:username, :password)
        user = User.find_by(username: strong_params[:username])
        byebug
    end
end
