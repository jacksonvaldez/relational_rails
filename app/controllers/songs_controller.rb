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
    if params[:sorted_songs].class == Array
      @songs = Song.find(params[:sorted_songs])
    elsif defined?(params[:song][:length_s_threshold]) == 'method' && params[:song][:length_s_threshold] == ''
      @songs = @artist.songs
    elsif defined?(params[:song][:length_s_threshold]) == 'method'
      @songs = Song.where("length_s > #{params[:song][:length_s_threshold]} AND artist_id = #{@artist.id}")
    else
      @songs = @artist.songs
    end
    # binding.pry
  end

  def new
    @artist = Artist.find(params[:id])
  end

  def create
    params[:top_100] == "Yes" ? params[:top_100] = true : params[:top_100] = false

    artist = Artist.find(params[:artist_id])
    artist.songs.create(song_params)

    redirect_to "/artists/#{params[:artist_id]}/songs"
  end

  def edit
    @song = Song.find(params[:id])
  end

  def update
    # require "pry"; binding.pry
    song = Song.find(params[:id])

    song.update(
      name: params[:name],
      top_100: params[:top_100] == "Yes" ? true : false,
      length_s: params[:length_s].to_i
    )
    song.save
    redirect_to "/songs/#{song.id}"
  end

  def sorted
    songs = Song.where(artist_id: params[:id]).order('lower(name)')
    song_ids = songs.map { |song| song.id }
    redirect_to controller: 'songs', action: 'show_by_artist', sorted_songs: song_ids
  end

  def delete
    Song.destroy(params[:song_id])
    redirect_to '/songs'
  end

  private

  def song_params
    params.permit(:name, :top_100, :length_s)
  end
end
