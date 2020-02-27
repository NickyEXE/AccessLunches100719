class Restaurant < ApplicationRecord
    has_many :reviews

    def self.add_restaurant_from_yelp_data(business)
        self.create(
            name: business["name"], 
            url: business["url"], 
            lat: business["coordinates"]["latitude"], 
            long: business["coordinates"]["longitude"], 
            image_url: business["image_url"], 
            address: business["location"]["display_address"].join(", "), 
            kind_of_food: business["categories"].map{|item| item["title"]}.join(", ")
        )
    end

    def batman
        "batman"
    end

    def average_rating
        if self.reviews.length > 0
            self.reviews.sum(:rating)/self.reviews.length
        else
            0
        end
    end


end
