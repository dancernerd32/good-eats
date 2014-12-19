class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.all
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)

    if @restaurant.save
      flash[:notice] = "You have successfully added a new restaurant."
      redirect_to restaurants_path
     else
       flash.now[:notice] = "Your restaurant couldn't be saved."
       render :new
    end
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    @review = @restaurant.reviews.build
  end

  private
  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :city, :state, :zip, :category, :description)
  end
end
