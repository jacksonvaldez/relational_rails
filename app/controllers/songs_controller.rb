class SongsController < ApplicationController

  def index
    @songs = Song.all
  end

  def show
    # binding.pry
    @song = Song.find(params[:id])
  end

end
