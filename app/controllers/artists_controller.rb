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
    # require "pry"; binding.pry
    params[:artist][:alive] == "true" ? alive = true : alive = false
    Artist.create(
      name: params[:artist][:name],
      alive: alive,
      monthly_listeners: params[:artist][:monthly_listeners].to_i
    )
    redirect_to '/artists/'
  end
end
