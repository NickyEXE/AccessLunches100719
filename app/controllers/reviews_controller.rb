class ReviewsController < ApplicationController
  before_action :authorized

  def create
    review = @current_user.reviews.create(review_params)
    if review.valid?
      redirect_to review.restaurant
    else
      flash[:errors] = review.errors.full_messages
      redirect_to restaurant_path(params[:review][:restaurant_id])
    end
  end

  private

  def review_params
     params.require(:review).permit(:content, :rating, :restaurant_id)
  end

end
