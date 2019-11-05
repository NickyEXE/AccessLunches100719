# README

Students need food in order to code effectively! 

Unfortunately, until now, Access Labs hasn't had any method to log data on which lunches work best for Flatiron students.

Think about how many lunches were consumed without providing us with delicious data! Lost forever! That changes today.

Pulling from the Yelp Fusion API, our goal will be to build an app that allows students to provide feedback on their lunches!

## What we have

Fortunately, we have Flatiron's standard auth and styling available to us, and a User model. Unfortunately, we have to build everything else!

## To start

Get a YELP API key if you're working on this from home. Make a file titled ".env" in your root directory, and add your API key in the format:
`YELP_KEY=YOUR_KEY_HERE`

This will allow you to store your API key for your app without pushing it up to GitHub accidentally and allowing you to get pwned. To access it in our app, we can now simply call `ENV['YELP_KEY']`.

Remember to bundle install!

## What we need

### Building the Models

First, we need a restaurants model (as well as a relevant controller) with the following columns:
* name
* url
* lat (float)
* long (float)
* image_url
* address
* kind_of_food

Second, we'll need a reviews model (as well as a relevant controller) that belongs to both user and restaurant with the following columns: 
* content
* rating (int)
* any foreign keys

### Hitting the API

Next, we need to build a script in our db/seeds.rb file to pull the nearest 1000 meters to 89 Prospect Street, Brooklyn, NY from Yelp. 

> Note: Where you put your API calls is up to the programmer. As this is a simple app and we're only pulling restaurants on initialization, a seed file is fine. When you're building your own app, think about where you might want to add it. 

The following link would be helpful to get started. We're looking to pull from "Business Search": https://www.yelp.com/developers/documentation/v3/get_started

Our db/seeds.rb method should work in three steps: 
- Make the initial query to the API (.hit_yelp_api)
- Receive a list of 50 businesses (the maximum Yelp will serve) (#get_businesses)
- Take each business and add it to our database (#add_business)

Feel free to throw a byebug in right after your response to play with the data to make it work! When you're done, you should have 50 restaurants in a database.

### Building the Controllers and Views
- First, let's make sure that people only see reviews and restaurants if they're logged in. Let's add `before_action :authorized` to the tops of our RestaurantsController and ReviewsController
- We should start by building our Restaurants Index action and view, so that our app doesn't break when we log in. It should render out all the restaurants.
- We should then build a Restaurant's Show page, which shows off all the restaurants.
- Let's create a form on the Restaurant's Show page to add a new review. This should redirect to the restaurant's show page once the review is created. 
- We *don't* need a review index or show. Instead, let's display all the reviews for a relevant restaurant on that restaurant's show page. Let's also include their average review, if it's available!

## Adding Validations

- We should make sure people can only make a review with a rating between 1 and 10! Otherwise some bad actors could completely throw off our mean!