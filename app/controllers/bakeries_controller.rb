class BakeriesController < ApplicationController

  def index
    @bakeries = Bakery.order(created_at: :desc)
  end

  def show
    # binding.pry
    @bakery = Bakery.find(params[:id])
  end

end
