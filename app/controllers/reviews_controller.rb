class ReviewsController < ApplicationController
    before_action :authorized


    def create
        @review = Review.new(safe_params)
        @review.user_id = @current_user.id
        @review.save
        redirect_to restaurant_path(params[:review][:restaurant_id])
    end

    def destroy
        @review = Review.find(params[:id])
        @review.destroy
        redirect_to restaurants_path
    end

    private

    def safe_params
        params.require(:review).permit(:restaurant_id, :content, :rating)
    end

end
