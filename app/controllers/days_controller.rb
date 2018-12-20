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
    @day = Day.all
  end

  def show
    @menu = @day.menu
  end

  private

  def set_day
    @day = Day.find(params[:id])
  end

  def params_day
    params.require(:day).permit(:weekday, :menu_id)
  end
end
