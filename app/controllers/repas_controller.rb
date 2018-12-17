class RepasController < ApplicationController

  before_action :set_repa, only: [:show, :update, :destroy]

  def new
    @repa = Repa.create
  end

  def create
    @repa = Repa.new(params_repa)
    if @repa.save
      redirect_to repa_path(@repa)
    else
      render_new
    end
  end

  def edit
  end

  def update
  end

  def destroy
    @repa.destroy
  end

  def index
    @repa = Repa.all
  end

  def show
  end

  private

  def set_repa
    @repa = Repa.find(params[:id])
  end

  def params_repa
    params.require(:repa).permit(:weekof, :season)
  end
end
