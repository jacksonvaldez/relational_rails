class BakersController < ApplicationController

  def index
    @bakers = Baker.all
    @working_bakers = Baker.where(is_working: true)
  end

  def show
    # binding.pry
    @baker = Baker.find(params[:id])
  end

  def show_by_bakery
    @bakery = Bakery.find(params[:id])
    params[:sorted_bakers].class == Array ? @bakers = Baker.find(params[:sorted_bakers]) : @bakers = @bakery.bakers
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

  def sorted
    bakers = Baker.where(bakery_id: params[:id])
    bakers = bakers.sort_by { |baker| baker.name.downcase }
    redirect_to controller: 'bakers', action: 'show_by_bakery', sorted_bakers: bakers
  end

end
