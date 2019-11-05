class Restaurant < ApplicationRecord
    has_many :reviews
    has_many :users, through: :users

    def self.create_business_from_yelp_data(business)
        self.create(name: business["name"], url: business["url"], lat: business["coordinates"]["latitude"], long: business["coordinates"]["longitude"], image_url: business["image_url"], address: business["location"]["display_address"].join(", "), kind_of_food: business["categories"].map{|item| item["title"]}.join(", "))        
    end

    def average_rating
        if self.reviews.length > 0
            self.reviews.map{|review| review.rating}.reduce(:+)/self.reviews.length
        else
            "No reviews yet!"
        end
    end

end
