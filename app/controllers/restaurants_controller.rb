class RestaurantsController < ApplicationController
    before_action :authorized


    def index
        @restaurants = Restaurant.all
        @review = Review.new
    end

    def show
        @review = Review.new
        @restaurant = Restaurant.find(params[:id])
    end

    def destroy
        Restaurant.find(params[:id]).destroy
        redirect_to restaurants_path
    end
end
