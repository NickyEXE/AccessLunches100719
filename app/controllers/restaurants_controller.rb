class RestaurantsController < ApplicationController
  before_action :authorized

  def index
    @restaurants = Restaurant.all
  end

end
