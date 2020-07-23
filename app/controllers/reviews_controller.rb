class ReviewsController < ApplicationController
  before_action :authorized

  def create
    review = @current_user.reviews.create(review_params)
    byebug
    redirect_to review.restaurant
  end

  private

  def review_params
    params.require(:review).permit(:rating, :content, :restaurant_id)
  end

end
