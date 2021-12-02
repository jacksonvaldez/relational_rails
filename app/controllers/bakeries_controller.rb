class BakeriesController < ApplicationController

  def index
    @bakeries = Bakery.order(created_at: :desc)
  end

  def show
    # binding.pry
    @bakery = Bakery.find(params[:id])
  end

  def new
  end

  def create
    params[:bakery][:is_open] == "true" ? is_open = true : is_open = false
    Bakery.create(
      name: params[:bakery][:name],
      is_open: is_open,
      customer_capacity: params[:bakery][:customer_capacity].to_i
    )
    redirect_to '/bakeries/'
  end

end
