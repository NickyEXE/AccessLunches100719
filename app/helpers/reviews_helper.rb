module ReviewsHelper

  def stars(num)
    if num
      "⭐️" * num
    else
      "No Reviews Yet!"
    end
  end

  def post_date(datetime)
    datetime.strftime("%m/%d/%Y")
  end

end
