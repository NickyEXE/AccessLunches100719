class Restaurant < ApplicationRecord
    has_many :reviews
    has_many :users, through: :reviews

    def average_review
        if self.reviews.count > 0
            self.reviews.map{|review| review.rating}.reduce(:+)/self.reviews.count
        else
            "No reviews available!"
        end
    end

    def average_review_stars
        if self.reviews.count > 0
            (1..average_review).map{|num| "⭐"}.join("")
        else
            average_review
        end
    end

    def self.add_restaurant_by_yelp_data(business)
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
