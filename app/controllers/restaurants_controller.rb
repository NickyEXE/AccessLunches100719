class RestaurantsController < ApplicationController
  before_action :authorized

  def index
    @restaurants = Restaurant.filter_by_type(params[:query]).sort_by_type(params[:Filter])
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    @review = Review.new
  end

end
