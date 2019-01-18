class IngredientsController < ApplicationController
  before_action :set_ingredient, only: [:show, :update, :destroy]
  def new
    @ingredient = Ingredient.new
  end
  def create

    @ingredient = Ingredient.new(params_ingredient)
    @menu = Menu.find(params[:menu_id])
    @day = Day.find(params[:day_id])
    @repa = Repa.find(params[:repa_id])
    @plat = Plat.find(params[:plat_id])
    @new_ingredient = Ingredient.new
    @controllerreference = Rails.application.routes.recognize_path(request.referrer)[:controller]
    if @controllerreference == "menus"
      respond_to do |format|
        if @ingredient.save
            format.html { redirect_to menu_path(menu_id: @menu.id) }
            format.js { }
        else
            format.html { render 'menus/show' }
            format.js { }
        end
      end
    elsif @controllerreference == "plats"
      respond_to do |format|
        if @ingredient.save
            format.html { redirect_to menu_day_repa_plat_path(menu_id: @menu.id, day_id: @day.id, repa_id: @repa.id, id: @plat.id) }
            format.js { }
        else
            format.html { render 'plats/show' }
            format.js { }
        end
      end
    end
  end

  def update

    @ingredient.update(params_ingredient)
    @menu = Menu.find(params[:menu_id])
    @day = Day.find(params[:day_id])
    @repa = Repa.find(params[:repa_id])
    @plat = Plat.find(params[:plat_id])
    @controllerreference = Rails.application.routes.recognize_path(request.referrer)[:controller]
    if @controllerreference == "repas"
      respond_to do |format|
        format.js { }
      end
    end
    if @controllerreference == "days"
      render 'ingredients/index'
    end
  end

  def destroy
    @ingredient.destroy
  end

  def index
    @menu = Menu.find(params[:menu_id])
    @ingredients = @menu.ingredients

    @todo = Todo.new
  end


  def show
  end

  private

  def set_ingredient
    @ingredient = Ingredient.find(params[:id])
  end

  def params_ingredient
    params.require(:ingredient).permit(:plat_id, :name, :ingredienttype, :quantity, :unity, :shop, :instock)
  end
end
