class Restaurant < ApplicationRecord
  has_many :reviews
  has_many :users, through: :reviews

  def self.create_by_yelp_hash(business)
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

  def average_review
    reviews.length > 0 && reviews.sum(:rating)/reviews.length
  end

  def self.by_type(query)
    where('kind_of_food LIKE ?', "%#{query}%")
  end

end
