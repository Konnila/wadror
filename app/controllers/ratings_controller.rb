class RatingsController < ApplicationController
  def index
  	@ratings = Rating.all

  	respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @ratings }
    end
  end

  def new
  	@rating = Rating.new
  	@beers = Beer.all
  end

  def create
  	Rating.create beer_id:params[:rating][:beer_id], score:params[:rating][:score]
  	redirect_to ratings_path
  end

end