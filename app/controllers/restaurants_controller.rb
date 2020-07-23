class RestaurantsController < ApplicationController
  before_action :authorized

  def index
    @restaurants = Restaurant.by_type(params[:query])
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    @review = Review.new
  end

end
