class RestaurantsController < ApplicationController
  before_action :authorized

  def index
    @restaurants = Restaurant.all
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end

end
