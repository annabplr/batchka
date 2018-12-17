class PlatsController < ApplicationController

  before_action :set_plat, only: [:show, :update, :destroy]

  def new
    @plat = Plat.create
  end

  def create
    @plat = Plat.new(params_plat)
    if @plat.save
      redirect_to plat_path(@plat)
    else
      render_new
    end
  end

  def edit
  end

  def update
  end

  def destroy
    @plat.destroy
  end

  def index
    @plat = Plat.all
  end

  def show
  end

  private

  def set_plat
    @plat = Plat.find(params[:id])
  end

  def params_plat
    params.require(:plat).permit(:weekof, :season)
  end
end
