class MenusController < ApplicationController
  before_action :set_restaurant

  def show
    @menu = @restaurant.menu
  end

  def new
    @menu = @restaurant.build_menu
  end

  def create
    @menu = @restaurant.build_menu(menu_params)
    if @menu.save
      redirect_to restaurant_menu_path(@restaurant), notice: "Menu created successfully."
    else
      render :new
    end
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def menu_params
    params.require(:menu).permit(:name)
  end
end
