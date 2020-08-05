class Restaurant < ApplicationRecord
  has_many :reviews
  has_many :users, through: :reviews

  scope :order_by_name, -> {order(:name)}
  scope :filter_by_type, -> (query){where("kind_of_food LIKE ?", "%#{query}%")}


  # def self.filter_by_type(query)
  #   where("kind_of_food LIKE ?", "%#{query}%")
  # end

  def self.find_or_create_business_from_yelp(business)
    find_or_create_by(
      name: business["name"],
      url: business["url"],
      lat: business["coordinates"]["latitude"],
      long: business["coordinates"]["longitude"],
      image_url: business["image_url"],
      address: business["location"]["display_address"].join(", "),
      kind_of_food: business["categories"].map{|item| item["title"]}.join(", ")
      )
  end

  # def self.order_by_name
  #   order(:name)
  # end

  def average_rating
    unless reviews.empty?
      reviews.average(:rating)
    end
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

  def self.get_restaurants_by_location(location)
    return all if location.blank?
    # get up to 50 restaurants from yelp
    search = YelpSearch.new(location).results
    # map through them, and find or create each restaurant that relates to the business we got from yelp
    if search["error"]
      restaurants = []
    else
      restaurants = search["businesses"].map{|business| Restaurant.find_or_create_business_from_yelp(business)}
    end
    Restaurant.where(id: restaurants.pluck(:id))
  end


  # Get query from user
  # find restaurants that match query
  ## done
  # send those back.

end
