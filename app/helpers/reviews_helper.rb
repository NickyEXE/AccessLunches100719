module ReviewsHelper

  def star_rating(rating)
    if rating
      "⭐" * rating
    else
      "No reviews yet!"
    end
  end

  def user_rating(review)
    review.user.username + ": " + star_rating(review.rating)
  end
end
