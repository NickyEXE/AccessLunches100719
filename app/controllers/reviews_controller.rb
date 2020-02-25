class ReviewsController < ApplicationController
    before_action :authorized


    def create
        review_params = params.require(:review).permit(:rating, :restaurant_id, :content)
        review = Review.new(review_params)
        review.user = @current_user
        review.save
        redirect_to review.restaurant
    end
end
