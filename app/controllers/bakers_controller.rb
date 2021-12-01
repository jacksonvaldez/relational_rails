class BakersController < ApplicationController

  def index
    @bakers = Baker.all
  end

  def show
    # binding.pry
    @baker = Baker.find(params[:id])
  end

end
