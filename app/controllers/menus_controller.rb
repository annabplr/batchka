class MenusController < ApplicationController

  before_action :set_menu, only: [:show, :update, :destroy]
  after_action :create_days, only: :create

  def new
    @menu = Menu.new
  end

  def create
    @menu = Menu.new(params_menu)
    @current_user = current_user
    @menu.user_id = @current_user.id
    @menus = Menu.all
    start_day
    def_season
    @menu.weekof = Date::DAYNAMES[@weekday.wday]
    if @menu.save
      redirect_to menu_path(@menu)
    else
      render :index
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
    @menu = Menu.new

    @menus = Menu.all
    @users = User.all
  end

  def show
    start_day
    create_week
    @days = @menu.days
    @repas = @menu.repas
  end

  def create_days
    create_week
    @resultweek.each do |r|
      Day.create(weekday: r, menu_id: @menu.id)
    end
    create_repas
    create_plat
  end

  def create_repas
    @days = @menu.days
    @days.each do |day|
      if current_user.breakfast == true
        Repa.create(repastype: "Petit déjeuner", day_id: day.id)
      end
      if current_user.lunch == true
        Repa.create(repastype: "Déjeuner", day_id: day.id)
      end
      if current_user.dinner == true
        Repa.create(repastype: "Diner", day_id: day.id)
      end
      if current_user.collation == true
        Repa.create(repastype: "Gouter", day_id: day.id)
      end
    end
  end

  def create_plat
    @repas = @menu.repas
    @repas.each do |repa|
    if repa.repastype == "Petit déjeuner" || repa.repastype == "Gouter"
        Plat.create(plattype: "Plat", repa_id: repa.id)
      elsif repa.repastype == "Déjeuner" || repa.repastype == "Diner"
        if current_user.starter == true
          Plat.create(plattype: "Entrée", repa_id: repa.id)
        end
        if current_user.maincourse == true
          Plat.create(plattype: "Plat", repa_id: repa.id)
        end
        if current_user.dessert == true
          Plat.create(plattype: "Dessert", repa_id: repa.id)
        end
      end
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
