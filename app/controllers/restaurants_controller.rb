class RestaurantsController < ApplicationController
    before_action :authorized

    def index
        @review = Review.new
        @restaurants = Restaurant.all
    end

    def search
        @restaurants = Restaurant.filter_restaurants_by_name(params[:search])
        @review = Review.new
        render :index
    end
        
    def show
        @review = Review.new
        @restaurant = Restaurant.find(params[:id])
    end

end
