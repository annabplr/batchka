class RepasController < ApplicationController

  before_action :set_repa, only: [:show, :update, :destroy]

  def index
    @repa = Repa.all
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
