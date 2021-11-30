class ArtistsController < ApplicationController

  def index
    @artists = Artist.all
  end

  def show
    # binding.pry
    @artist = Artist.find(params[:id])
  end

end
