class SongsController < ApplicationController

  def index
    @songs = Song.all
    @top_100_songs = Song.where(top_100: true)
  end

  def show
    # binding.pry
    @song = Song.find(params[:id])
  end

  def show_by_artist
    @artist = Artist.find(params[:id])
    params[:sorted_songs].class == Array ? @songs = Song.find(params[:sorted_songs]) : @songs = @artist.songs
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

  def edit
    @song = Song.find(params[:id])
    @artist = @song.artist
  end

  def update
    # require "pry"; binding.pry
    song = Song.find(params[:id])
    params[:top_100] == "true" ? top_100 = true : top_100 = false
    song.update(
      name: params[:song][:name],
      top_100: top_100,
      length_s: params[:song][:length_s].to_i
    )
    song.save
    redirect_to "/songs/#{song.id}"
  end

  def sorted
    songs = Song.where(artist_id: params[:id])
    songs = songs.sort_by { |song| song.name.downcase }
    redirect_to controller: 'songs', action: 'show_by_artist', sorted_songs: songs
  end

  def delete
    Song.destroy(params[:id])
    redirect_to '/songs'
  end
end
