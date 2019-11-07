class ReviewsController < ApplicationController
    before_action :authorized

    


    def create
        strong_params = params.require(:review).permit(:content, :rating, :restaurant_id)
        review = @current_user.reviews.create(strong_params)
        redirect_to restaurant_path(params[:review][:restaurant_id]) 
    end

end
