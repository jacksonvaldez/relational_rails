class BakeriesController < ApplicationController

  def index
    @bakeries = Bakery.all
  end

  def show
    # binding.pry
    @bakery = Bakery.find(params[:id])
  end

end
