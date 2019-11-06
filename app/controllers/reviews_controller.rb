class ReviewsController < ApplicationController
    before_action :authorized 


    def create
        review_params = params.require(:review).permit(:rating, :content, :restaurant_id)
        Review.create(rating: review_params["rating"], content: review_params["content"], restaurant_id: review_params["restaurant_id"], user_id: @current_user.id)
        redirect_to restaurant_path(review_params["restaurant_id"])
    end
end
