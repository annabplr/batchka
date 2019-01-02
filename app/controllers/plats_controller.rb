class PlatsController < ApplicationController

  before_action :set_plat, only: [:show, :edit, :update, :destroy]

  def new
    @plat = Plat.create
  end

  def create
    @plat = Plat.new(params_plat)
    if @plat.save
      redirect_to plat_path(@plat)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @plat.update(params_plat)
    @day = Day.find(params[:day_id])
    @menu = Menu.find(params[:menu_id])
    @repa = Repa.find(params[:repa_id])

  if @plat.save
      respond_to do |format|
        format.html { redirect_to menu_day_repa_plat_path(menu_id: @menu.id, day_id: @day.id, repa_id: @repa.id, id: @plat.id) }
        format.js { }
      end
    else
      respond_to do |format|
        format.html { render 'plats/show' }
        format.js { }
      end
    end

  end


  def destroy
    @plat.destroy
    redirect_to menu_day_path(@plat)
  end

  def index
    @plat = Plat.all
  end

  def show
    @ingredient = Ingredient.new
    @day = Day.find(params[:day_id])
    @menu = Menu.find(params[:menu_id])
    @repa = Repa.find(params[:repa_id])
  end

  private

  def set_plat
    @plat = Plat.find(params[:id])
  end

  def params_plat
    params.require(:plat).permit(:repa_id, :name, :plattype)
  end
end

