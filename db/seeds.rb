# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

def hit_yelp_api
    url = "https://api.yelp.com/v3/businesses/search"
    params = {
        term: "lunch",
        location: "89 Prospect Street, Brooklyn, NY",
        limit: 50,
        radius: 1000
    }
    response = HTTP.auth("Bearer #{ENV['YELP_KEY']}").get(url, params: params)
    response.parse
end

def get_businesses
    response = hit_yelp_api
    response["businesses"].each do |business|
        Restaurant.create_business_from_yelp_data(business)
    end
end

get_businesses