class ArtistsController < ApplicationController

  def index
    @artists = Artist.order(created_at: :desc)
  end

  def show
    @artist = Artist.find(params[:id])
  end

  def new

  end

  def create

    params[:artist][:alive] == "true" ? alive = true : alive = false
    Artist.create({
      name: params[:artist][:name],
      alive: alive,
      monthly_listeners: params[:artist][:monthly_listeners].to_i
    })
    redirect_to '/artists/'
  end

  def update
    # require "pry"; binding.pry
    artist = Artist.find(params[:id])
    params[:alive] == "true" ? alive = true : alive = false
    artist.update(
      name: params[:artist][:name],
      alive: alive,
      monthly_listeners: params[:artist][:monthly_listeners].to_i
    )
    artist.save
    redirect_to "/artists/#{artist.id}"
  end

  def edit
    @artist = Artist.find(params[:id])
  end

  def delete
    Artist.destroy(params[:id])
    redirect_to '/artists'

  end
end
