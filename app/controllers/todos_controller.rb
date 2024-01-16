class TodosController < ApplicationController
  before_action :fetch_todos

  def index
    @todo = Todo.new
  end

  def create
    @todo = Todo.create(description: params[:todo][:description])
    if @todo.valid?
      redirect_to root_path
    else
      render :index
    end
  end

  def destroy
    @todo = Todo.find(params[:id])
    @todo.destroy

    if htmx?
      head :ok  # TODO: add flash message
    else
      redirect_to root_path
    end
  end

  private

  def fetch_todos
    @todos = Todo.all
  end
end
