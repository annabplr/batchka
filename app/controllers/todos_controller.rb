class TodosController < ApplicationController

  before_action :set_todo, only: [:show, :update, :destroy]

  def new
    @todo = Todo.create
  end

  def create
    @todo = Todo.create(params_todo)
    @menu = @todo.menu
    redirect_to menu_ingredients_path(menu_id: @menu.id)
  end

  def edit
  end

  def update
  end

  def destroy
    @todo.destroy
  end

  def index
    @menu = Menu.find(params[:menu_id])
    @todos = @menu.todos
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
end
