class Restaurant < ApplicationRecord
    has_many :reviews
    has_many :users, through: :reviews

    def self.add_one_restaurant_from_yelp_api(business)
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

    def self.add_all_the_restaurants_from_yelp_api(businesses)
        businesses.each do |business|
            self.add_one_restaurant_from_yelp_api(business)
        end
    end



end
