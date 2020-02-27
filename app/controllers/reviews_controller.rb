class ReviewsController < ApplicationController
    before_action :authorized


    def create
        new_review = Review.new(strong_params)
        new_review.user_id = @current_user.id
        new_review.save
        redirect_to restaurant_path(strong_params[:restaurant_id])
    end

    private

    def strong_params
        strong_params = params.require(:review).permit(:rating, :content, :restaurant_id)
    end
end
