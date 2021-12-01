class SongsController < ApplicationController

  def index
    @songs = Song.all
  end

  def show
    # binding.pry
    @song = Song.find(params[:id])
  end

  def show_by_artist
    artist = Artist.find(params[:id])
    @songs = artist.songs
  end

end
