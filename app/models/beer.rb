class Beer < ActiveRecord::Base
  attr_accessible :brewery_id, :name, :style
  belongs_to :brewery
  has_many :ratings

  def average_rating
  	allratings = ratings.collect {|b| b.score }
  	allratings.inject(0.0) { |sum, el| sum + el } / allratings.size
  end

  def to_s
  	name + " (" + brewery.name + ")"
  end
end
