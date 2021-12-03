class BakersController < ApplicationController

  def index
    @bakers = Baker.all
  end

  def show
    # binding.pry
    @baker = Baker.find(params[:id])
  end

  def show_by_bakery
    @bakery = Bakery.find(params[:id])
    @bakers = @bakery.bakers
  end

  def new
    @bakery = Bakery.find(params[:id])
  end

  def create
    params[:is_working] == "true" ? is_working = true : is_working = false
    Baker.create({
      name: params[:baker][:name],
      is_working: is_working,
      salary: params[:baker][:salary].to_i,
      bakery_id: params[:id]
    })
    redirect_to "/bakeries/#{params[:id]}/bakers"
  end

  def edit
    @baker = Baker.find(params[:id])
    @bakery = @baker.bakery
  end

  def update
    # require "pry"; binding.pry
    baker = Baker.find(params[:id])
    params[:is_working] == "true" ? is_working = true : is_working = false
    baker.update(
      name: params[:baker][:name],
      is_working: is_working,
      salary: params[:baker][:salary].to_i
    )
    baker.save
    redirect_to "/bakers/#{baker.id}"
  end

end
