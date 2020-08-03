# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# def search
#   url = "https://api.yelp.com/v3/businesses/search"
#   params = {
#     term: "lunch",
#     location: "89 Prospect St, Brooklyn, NY",
#     limit: 50
#   }

#   response = HTTP.auth("Bearer #{ENV['YELP_KEY']}").get(url, params: params)
#   response.parse
# end

Restaurant.get_restaurants_by_location("89 Prospect St, NY, NY")
