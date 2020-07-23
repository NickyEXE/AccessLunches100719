# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# Returns a parsed json object of the request
def search(term, location)
  url = "https://api.yelp.com/v3/businesses/search"
  params = {
    term: term,
    location: location,
    limit: 50
  }
  response = HTTP.auth("Bearer #{ENV['YELP_KEY']}").get(url, params: params)
  response.parse
end

results = search("lunch", "89 Prospect St., New York, NY")
results["businesses"].each do |business|
  Restaurant.create_by_yelp_hash(business)
end
