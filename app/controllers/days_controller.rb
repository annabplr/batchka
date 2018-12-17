class DaysController < ApplicationController

  before_action :set_day, only: [:show, :update, :destroy]

  def new
    @day = Day.create
  end

  def create
    @day = Day.new(params_day)
    if @day.save
      redirect_to day_path(@day)
    else
      render_new
    end
  end

  def edit
  end

  def update
  end

  def index
    @day = Day.all
  end

  def show
  end

  private

  def set_day
    @day = Day.find(params[:id])
  end

  def params_day
    params.require(:day).permit(:weekof, :season)
  end
end
