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
end
