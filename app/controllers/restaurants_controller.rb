class RestaurantsController < ApplicationController
  before_action :authorized

  def index
    @location_query = params[:location_query]
    @restaurants = Restaurant.get_restaurants_by_location(params[:location_query])
      .filter_by_type(params[:query])
      .sort_by_type(params[:Filter])
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    @review = Review.new
  end

end
