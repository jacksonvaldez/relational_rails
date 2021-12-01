class ArtistsController < ApplicationController

  def index
    @artists = Artist.order(created_at: :desc)
  end

  def show
    @artist = Artist.find(params[:id])
  end

end
