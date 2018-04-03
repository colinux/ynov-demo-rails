class RestaurantsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @restaurants = Restaurant.all
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    @new_comment = Comment.new
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    restaurant_params = params.require(:restaurant).permit(:name, :city_id, :photo)

    @restaurant = Restaurant.new(restaurant_params)
    @restaurant.user = current_user

    if @restaurant.valid?
      @restaurant.save!

      redirect_to restaurant_path(@restaurant)
    else
      # réafficher le form avec les erreurs
      render :new
    end
  end
end
