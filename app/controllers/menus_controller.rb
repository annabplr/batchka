class MenusController < ApplicationController

  before_action :set_menu, only: [:show, :update, :destroy]

  def new
    @menu = Menu.new
  end

  def create
    @menu = Menu.new(params_menu)
    @current_user = current_user
    @menu.user_id = @current_user.id

    @day = Menu.last.startdate.split('-')
    @weekday = Date.new(day[0].to_i, day[1].to_i, day[2].to_i).wday

    if @day[1] == "06" || @day[1] == "07" || @day[1] == "08"
      @menu.season = "summer"
    elsif @day[1] == "09" || @day[1] == "10" || @day[1] == "11"
      @menu.season = "fall"
    elsif @day[1] == "12" || @day[1] == "01" || @day[1] == "02"
      @menu.season = "winter"
    else
      @menu.season = "spring"
    end

    if @weekday == 1
      @menu.weekof = "monday"
    elsif @weekday == 2
      @menu.weekof = "tuesday"
    elsif @weekday == 3
      @menu.weekof = "wednesday"
    elsif @weekday == 4
      @menu.weekof = "thursday"
    elsif @weekday == 5
      @menu.weekof = "friday"
    elsif @weekday == 6
      @menu.weekof = "saturday"
    elsif @weekday == 0
      @menu.weekof = "sunday"
    end

    @menu.save!
    redirect_to menu_path(@menu)
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

  end

  private

  def set_menu
    @menu = Menu.find(params[:id])
  end

  def params_menu
    params.require(:menu).permit(:startdate)
  end
end
