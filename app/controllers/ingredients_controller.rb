class IngredientsController < ApplicationController
  before_action :set_ingredient, only: [:show, :update, :destroy]

  def new
    @ingredient = Ingredient.new
  end

  def create
    @ingredient = Ingredient.create(params_ingredient)
    @menu = Menu.find(params[:menu_id])
    @day = Day.find(params[:day_id])
    @repa = Repa.find(params[:repa_id])
    @plat = Plat.find(params[:plat_id])
    redirect_to menu_day_path(menu_id: @menu.id,id: @day.id)
  end

  def edit
  end

  def update
  end

  def destroy
    @ingredient.destroy
  end

  def index
    @ingredient = Ingredient.all
  end

  def show
  end

  private

  def set_ingredient
    @ingredient = Ingredient.find(params[:id])
  end

  def params_ingredient
    params.require(:ingredient).permit(:plat_id, :name, :ingredienttype, :quantity)
  end
end
