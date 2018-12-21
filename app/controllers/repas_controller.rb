class RepasController < ApplicationController

  before_action :set_repa, only: [:show, :update, :destroy]

  def index
    @menu = Menu.find(params[:menu_id])
    @ingredients = @menu.ingredients
  end

  def show


  end

  def edit
  end

  def update
  end

  def destroy
    @repa.destroy
  end



  private

  def set_repa
    @repa = Repa.find(params[:id])
  end
end
