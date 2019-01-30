class TodosController < ApplicationController
  before_action :set_todo, only: [:show, :update, :destroy]

  def new
    @todo = Todo.new
  end

  def create
    @todo = Todo.new(params_todo)
    @menu = Menu.find(params[:menu_id])
    @new_todo = Todo.new
    respond_to do |format|
      if @todo.save
        format.html { redirect_to menu_ingredients_path(menu_id: @menu.id) }
        format.js {}
      else
        format.html { render 'ingredients/index' }
        format.js {}
      end
    end
  end

  def edit
  end

  def update
    if @todo.user_id == current_user.id
      @todo.update(params_todo)
      @menu = Menu.find(params[:menu_id])
      respond_to do |format|
        format.js {}
      end
    end
  end

  def destroy
    @todo.destroy
  end

  def index
    @menu = Menu.find(params[:menu_id])
    @todos = @menu.todos
    todo_monday
    todo_tuesday
    todo_wednesday
    todo_thursday
    todo_friday
    todo_saturday
    todo_sunday
    todo_none
  end

  def show
  end

  private

  def set_todo
    @todo = Todo.find(params[:id])
  end

  def params_todo
    params.require(:todo).permit(:menu_id, :ingredient_id, :actionverb, :daydue, :comments, :done)
  end

  def todo_monday
    @todomonday = @todos.select{|todo| todo.daydue == "Lundi" }
  end

  def todo_tuesday
    @todotuesday = @todos.select{|todo| todo.daydue == "Mardi" }
  end

  def todo_wednesday
    @todowednesday = @todos.select{|todo| todo.daydue == "Mercredi" }
  end

  def todo_thursday
    @todothursday = @todos.select{|todo| todo.daydue == "Jeudi" }
  end

  def todo_friday
    @todofriday = @todos.select{|todo| todo.daydue == "Vendredi" }
  end

  def todo_saturday
    @todosaturday = @todos.select{|todo| todo.daydue == "Samedi" }
  end

  def todo_sunday
    @todosunday = @todos.select{|todo| todo.daydue == "Dimanche" }
  end

  def todo_none
    @todonone = @todos.select{|todo| todo.daydue == "" }
  end
end
