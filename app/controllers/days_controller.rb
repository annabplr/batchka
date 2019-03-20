class DaysController < ApplicationController

  before_action :set_day, only: [:show, :update, :destroy]

  def new
    @day = Day.create
  end

  def edit
  end

  def update

  end

  def index
    @copied_menu = Menu.new
    @menu = Menu.find(params[:menu_id])
    @days = @menu.days
  end

  def show
    @menu = @day.menu
    @ingredient = Ingredient.new
  end

  private

  def set_day
    @day = Day.find(params[:id])
  end

  def params_day
    params.require(:day).permit(:weekday, :menu_id)
  end
end
