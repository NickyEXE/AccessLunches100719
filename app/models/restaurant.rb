class Restaurant < ApplicationRecord
    has_many :reviews
    has_many :users, through: :reviews


    def self.filter_restaurants_by_name(term)
        self.all.select{|restaurant| restaurant.name.downcase.include?(term.downcase)}
    end

    def self.add_restaurant_to_database_from_yelp(business)
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
end
