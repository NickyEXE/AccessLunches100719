module ReviewsHelper

  def stars(num)
    if num
      if ((0.25 < num%1) && (num%1 < 0.75))
        "⭐️" * num.floor + "✨"
      else
        "⭐️" * num.round
      end
    else
      "No Reviews Yet!"
    end
  end

  def post_date(datetime)
    datetime.strftime("%m/%d/%Y")
  end

end
