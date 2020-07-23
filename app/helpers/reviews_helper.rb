module ReviewsHelper

  def stars(num)
    "⭐️" * num
  end

  def post_date(datetime)
    datetime.strftime("%m/%d/%Y")
  end

end
