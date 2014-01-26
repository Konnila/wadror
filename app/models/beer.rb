class Beer < ActiveRecord::Base
	include RatingAverage
	
  attr_accessible :brewery_id, :name, :style
  belongs_to :brewery
  has_many :ratings, dependent: :destroy

  def to_s
  	name + " (" + brewery.name + ")"
  end
end
