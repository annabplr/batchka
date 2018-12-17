class IngredientsController < ApplicationController

  before_action :set_ingredient, only: [:show, :update, :destroy]

  def new
    @ingredient = Ingredient.create
  end

  def create
    @ingredient = Ingredient.new(params_ingredient)
    if @ingredient.save
      redirect_to ingredient_path(@ingredient)
    else
      render_new
    end
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
    params.require(:ingredient).permit(:weekof, :season)
  end
end
