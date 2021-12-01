class BakersController < ApplicationController

  def index
    @bakers = Baker.all
  end

  def show
    # binding.pry
    @baker = Baker.find(params[:id])
  end

  def show_by_bakery
    bakery = Bakery.find(params[:id])
    @bakers = bakery.bakers
  end

end
