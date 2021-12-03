class SongsController < ApplicationController

  def index
    @songs = Song.all
  end

  def show
    # binding.pry
    @song = Song.find(params[:id])
  end

  def show_by_artist
    @artist = Artist.find(params[:id])
    @songs = @artist.songs
  end

  def new
    @artist = Artist.find(params[:id])
  end

  def create
    params[:top_100] == "true" ? top_100 = true : top_100 = false
    Song.create({
      name: params[:song][:name],
      top_100: top_100,
      length_s: params[:song][:length_s].to_i,
      artist_id: params[:id]
    })
    redirect_to "/artists/#{params[:id]}/songs"
  end

end
