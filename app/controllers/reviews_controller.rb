class ReviewsController < ApplicationController
  before_action :authorized

  def create
    review = @current_user.reviews.create(review_params)
    redirect_to review.restaurant
  end

  private

  def review_params
     params.require(:review).permit(:content, :rating, :restaurant_id)
  end

end
