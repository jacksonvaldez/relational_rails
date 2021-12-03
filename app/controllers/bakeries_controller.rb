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

  def update
    # require "pry"; binding.pry
    bakery = Bakery.find(params[:id])
    params[:is_open] == "true" ? is_open = true : is_open = false
    bakery.update(
      name: params[:bakery][:name],
      is_open: is_open,
      customer_capacity: params[:bakery][:customer_capacity].to_i
    )
    bakery.save
    redirect_to "/bakeries/#{bakery.id}"
  end

  def edit
    @bakery = Bakery.find(params[:id])
  end

  def delete
    Baker.where(bakery_id: params[:id]).select(:id).destroy_all
    Bakery.destroy(params[:id])
    redirect_to '/bakeries'

  end

end
