class BeerClub < ActiveRecord::Base
  attr_accessible :city, :founded, :name
  has_many :users, through: :memberships
end
