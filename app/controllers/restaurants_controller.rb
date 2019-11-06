class RestaurantsController < ApplicationController
    before_action :authorized 

    def index
        @restaurants = Restaurant.all
        @review = Review.new
    end

    def show
        @restaurant = Restaurant.find(params["id"])
        @review = Review.new
        @reviews = @restaurant.reviews
    end

end
