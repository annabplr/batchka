class MenusController < ApplicationController

  before_action :set_menu, only: [:show, :update, :destroy]
  before_action :create_days, only: :show

  def new
    @menu = Menu.new
  end

  def create
    @menu = Menu.new(params_menu)
    @current_user = current_user
    @menu.user_id = @current_user.id

    start_day

    def_season

    @menu.weekof = Date::DAYNAMES[@weekday.wday]

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
    start_day
    create_week
  end

  def create_days
    create_week

    @resultweek.each do |r|
      Day.create(weekday: r, menu_id: @menu.id)
    end
  end

  private

  def start_day
    @startday = @menu.startdate.split('-')
    @weekday = Date.new(@startday[0].to_i, @startday[1].to_i, @startday[2].to_i)
  end

  def create_week
    if @menu.weekof == "Monday"
      dayposition = 0
    elsif @menu.weekof == "Tuesday"
      dayposition = 1
    elsif @menu.weekof == "Wednesday"
      dayposition = 2
    elsif @menu.weekof == "Thursday"
      dayposition = 3
    elsif @menu.weekof == "Friday"
      dayposition = 4
    elsif @menu.weekof == "Saturday"
      dayposition = 5
    elsif @menu.weekof == "Sunday"
      dayposition = 6
    end

    globalweek = ["Lundi", "Mardi", "Mercredi", "Jeudi", "Vendredi", "Samedi", "Dimanche", "Lundi", "Mardi", "Mercredi", "Jeudi", "Vendredi", "Samedi"]
    return @resultweek = globalweek[dayposition..(dayposition + 6)]
  end



  def def_season
    if @startday[1] == "06"
      @menu.season = "summer"
    elsif @startday[1] == "07"
      @menu.season = "summer"
    elsif @startday[1] == "08"
      @menu.season = "summer"
    elsif @startday[1] == "09"
      @menu.season = "fall"
    elsif @startday[1] == "10"
      @menu.season = "fall"
    elsif @startday[1] == "11"
      @menu.season = "fall"
    elsif @startday[1] == "12"
      @menu.season = "winter"
    elsif @startday[1] == "01"
      @menu.season = "winter"
    elsif @startday[1] == "02"
      @menu.season = "winter"
    else
      @menu.season = "spring"
    end
  end

  def set_menu
    @menu = Menu.find(params[:id])
  end

  def params_menu
    params.require(:menu).permit(:startdate)
  end
end
