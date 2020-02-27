class RestaurantsController < ApplicationController
    before_action :authorized


    def index
        @review = Review.new
        @restaurants = Restaurant.all
    end

    def show
        @restaurant = Restaurant.find(params[:id])
        @review = Review.new
    end

end
