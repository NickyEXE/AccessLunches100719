class Restaurant < ApplicationRecord
  has_many :reviews
  has_many :users, through: :reviews

  def self.create_business_by_yelp_hash(business)
    create(
      name: business["name"],
      url: business["url"],
      lat: business["coordinates"]["latitude"],
      long: business["coordinates"]["longitude"],
      image_url: business["image_url"],
      address: business["location"]["display_address"].join(", "),
      kind_of_food: business["categories"].map{|item| item["title"]}.join(", ")
      )
  end

  def average_rating
    unless reviews.empty?
      reviews.average(:rating).round
    end
  end

  def self.filter_by_type(query)
    where("kind_of_food LIKE ?", "%#{query}%")
  end

  def self.sort_by_type(selected_type)
    case selected_type
      when "Name"
        order(:name)
      when "Rating"
        order(:average_rating)
      else
        all
    end
  end


  # Get query from user
  # find restaurants that match query
  ## done
  # send those back.

end
