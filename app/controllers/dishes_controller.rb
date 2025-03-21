class DishesController < ApplicationController
  before_action :set_menu, only: [:index, :new, :create]

  def index
    @dishes = @menu.dishes
  end

  def new
    @dish = @menu.dishes.build
  end

  def create
    @dish = @menu.dishes.build(dish_params)
    if @dish.save
      redirect_to restaurant_menu_path(@menu.restaurant), notice: "Dish added successfully."
    else
      render :new
    end
  end

  def edit
    @dish = Dish.find(params[:id])
  end

  def update
    @dish = Dish.find(params[:id])
    if @dish.update(dish_params)
      redirect_to restaurant_menu_path(@dish.menu.restaurant), notice: "Dish updated successfully."
    else
      render :edit
    end
  end

  def destroy
    @dish = Dish.find(params[:id])
    @dish.destroy
    redirect_to restaurant_menu_path(@dish.menu.restaurant), notice: "Dish deleted successfully."
  end

  private

  def set_menu
    @menu = Menu.find_by(restaurant_id: params[:restaurant_id])
  end

  def dish_params
    params.require(:dish).permit(:name, :price)
  end
end
