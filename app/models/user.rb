class User < ActiveRecord::Base
	include RatingAverage

	has_secure_password
	
	validates :username, uniqueness: true, length: {minimum: 3, maximum: 15}
	validates_format_of :password, with: /\d/, on: :create
	validates_format_of :password, with: /[A-Z]/, on: :create

  attr_accessible :username, :password, :password_confirmation
  has_many :ratings, dependent: :destroy
  has_many :memberships, dependent: :destroy
  has_many :beers, through: :ratings
  has_many :beer_clubs, through: :memberships, :uniq => true

  def favorite_beer
    return nil if ratings.empty?   # palautetaan nil jos reittauksia ei ole
    ratings.sort_by(&:score).last.beer 
  end

  def favorite_style
  	return nil if ratings.empty?
  	ratings.group_by { |r| r.beer.style }.map { |s, rs| [s, rs.map{|r| r.score}.sum / rs.size.to_f] }
  		  .sort_by { |x, y| y}.last.first
  end

  def favorite_brewery
  	return nil if beers.empty?
  	User.first.ratings.group_by {|r| r.beer.brewery }.map { |s, rs| [s, rs.map{|r| r.score}.sum / rs.size.to_f] }
  			.last.first.name
  end
end
