class RestaurantsController < ApplicationController
  
  def index
    @restaurants = Restaurant.paginate(page: params[:page])
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      flash[:info] = "Restaurant creation success"
      redirect_to restaurant_path(@restaurant)
    else
      render 'new'
    end
  end

  def edit
    @restaurant = Restaurant.find(params[:id])
  end

  def update
    @restaurant = Restaurant.find(params[:id])
    if @restaurant.update_attributes(restaurant_params)
      flash[:success] = "Restaurant updated"
      redirect_to @restaurant
    else
      render 'edit'
    end
  end

  def destroy
    Restaurant.find(params[:id]).destroy
    flash[:success] = "Restaurant deleted"
    redirect_to restaurants_path
  end
end

  private

    def restaurant_params
      params.require(:restaurant).permit(:name, :description)
    end
