class ReviewsController < ApplicationController

    def create
        @current_user.reviews.create(params.require(:review).permit(:rating, :content, :restaurant_id))
        redirect_to Restaurant.find(params[:review][:restaurant_id])
    end
end
