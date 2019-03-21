class MenusController < ApplicationController
  before_action :set_menu, only: [:show, :update, :destroy]

  def new
    @menu = Menu.new
    @menu.valid?
  end

  def create
    if params_menu[:startdate].present?
      @menu = Menu.new(params_menu)
      @allmenus = Menu.all
      @user = current_user
      @menus = @user.menus.all if @user
      @current_user = current_user
      @menu.user_id = @current_user.id
      @menus = Menu.all
      start_day
      def_season
      @menu.weekof = Date::DAYNAMES[@weekday.wday]

      if @menu.save
        create_days
        redirect_to menu_path(@menu)
      else
        render "index"
      end
    else
      @error = "Merci de sélectionner une date !"
      @allmenus = Menu.all
      @user = current_user
      @menus = @user.menus.all if @user
      @current_user = current_user
      render "index"
    end
  end

  def destroy
    @menu.destroy
  end

  def index
    @menu = Menu.new
    @user = current_user
    @menus = @user.menus.all if @user
    @allmenus = Menu.all
  end

  def show
    start_day
    create_week
    @days = @menu.days
    @repas = @menu.repas
    @ingredient = Ingredient.new
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

  def duplicate_menu
    if params_menu[:startdate].present?
      @menu = Menu.new(params_copiedmenu)
      menu_to_copy = Menu.find(params[:id])
      start_day
      def_season
      @menu.weekof = Date::DAYNAMES[@weekday.wday]
      @menu.user_id = current_user.id
      @menu.save!
      create_week
      week = []
      @resultweek.each do |day_to_copy|
        new_day = Day.create(weekday: day_to_copy, menu_id: @menu.id)
        week << new_day
      end
      duplicate_plats_ingredients(menu_to_copy, week)

      respond_to do |format|
        format.html { redirect_to menus_path }
      end
    else
      @error = "Merci de sélectionner une date !"
      @copied_menu = Menu.new
      @menu = Menu.find(params[:id])
      @days = @menu.days
      render 'days/index'
    end
  end

  def duplicate_plats_ingredients(menu, week)
    menu.days.each_with_index do |day, index|
      day.repas.each do |repa_to_copy|
        copied_repa = Repa.create(repastype: repa_to_copy.repastype, day_id: week[index].id)
        repa_to_copy.plats.each do |plat_to_copy|
          copied_plat = Plat.create(name: plat_to_copy.name, plattype: plat_to_copy.plattype, link: plat_to_copy.link, repa_id: copied_repa.id)
          plat_to_copy.ingredients.each do |ingredient_to_copy|
            copied_ingredient = Ingredient.create(name: ingredient_to_copy.name , ingredienttype: ingredient_to_copy.ingredienttype, quantity: ingredient_to_copy.quantity, unity: ingredient_to_copy.unity , instock: false , plat_id: copied_plat.id )
          end
        end
      end
    end
  end

  private

  def start_day
    @startday = @menu.startdate.day
    @startmonth = @menu.startdate.month
    @startyear = @menu.startdate.year

    @weekday = @menu.startdate
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
    if @startmonth == 6
      @menu.season = "summer"
    elsif @startmonth == 7
      @menu.season = "summer"
    elsif @startmonth == 8
      @menu.season = "summer"
    elsif @startmonth == 9
      @menu.season = "fall"
    elsif @startmonth == 10
      @menu.season = "fall"
    elsif @startmonth == 11
      @menu.season = "fall"
    elsif @startmonth == 12
      @menu.season = "winter"
    elsif @startmonth == 1
      @menu.season = "winter"
    elsif @startmonth == 2
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

  def params_copiedmenu
    params.require(:menu).permit(:startdate)
  end
end
