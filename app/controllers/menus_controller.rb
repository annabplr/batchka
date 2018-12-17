class MenusController < ApplicationController

  before_action :set_menu, only: [:show, :update, :destroy]

  def new
    @menu = Menu.create
  end

  def create
    @menu = Menu.new(params_menu)
    if @menu.save
      redirect_to menu_path(@menu)
    else
      render_new
    end
  end

  def edit
  end

  def update
  end

  def destroy
    @menu.destroy
  end

  def index
    @menu = Menu.all
  end

  def show
    @menu
  end

  private

  def set_menu
    @menu = Menu.find(params[:id])
  end

  def params_menu
    params.require(:menu).permit(:weekof, :season)
  end
end
