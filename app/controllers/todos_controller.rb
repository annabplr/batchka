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
    @todo.update(params_todo)
    @menu = Menu.find(params[:menu_id])
    redirect_to menu_todos_path(menu_id: @menu.id)
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
