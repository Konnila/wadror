module RatingAverage
  def average_rating
    allratings = ratings.collect {|b| b.score }
  	allratings.inject(0.0) { |sum, el| sum + el } / allratings.size
  end
end