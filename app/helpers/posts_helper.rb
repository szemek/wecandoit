module PostsHelper
  def diff_date(date)
    distance_of_time_in_words(Time.now, date)
  end
end
