class TodosController < ApplicationController

  before_action :set_todo, only: [:show, :update, :destroy]

  def new
    @todo = Todo.create
  end

  def create
    @todo = Todo.new(params_todo)
    if @todo.save
      redirect_to todo_path(@todo)
    else
      render_new
    end
  end

  def edit
  end

  def update
  end

  def destroy
    @todo.destroy
  end

  def index
    @todo = Todo.all
  end

  def show
  end

  private

  def set_todo
    @todo = Todo.find(params[:id])
  end

  def params_todo
    params.require(:todo).permit(:weekof, :season)
  end
end
