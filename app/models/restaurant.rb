class Restaurant < ApplicationRecord

    def index
        @Restaurants = Restaurant.all
    end

end
