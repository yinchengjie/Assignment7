class TodoItemsController < ApplicationController

  before_action :set_todo_list, only: [:create, :new, :edit, :show, :update, :destroy]

  def create
    @todo_item = @todo_list.todo_items.new(todo_item_params)
    if @todo_item.save
      redirect_to @todo_list, notice: "Todo item successfully added!"
    else
      redirect_to @todo_list, alert: "Unable to add todo item!"
    end
  end

  def new
    @todo_item = @todo_list.todo_items.new
  end

  def show
  end

  def edit
  end

  def update
    @todo_item = @todo_list.todo_items.find(params[:id])
    if @todo_item.update(todo_item_params)
      redirect_to @todo_list, notice: "Todo item was successfully updated!"
    else
      redirect_to @todo_list, alert: "Unable to update todo item!"
    end
  end

  def destroy
    @todo_item = @todo_list.todo_items.find(params[:id])
    @todo_item.destroy
    redirect_to @todo_list, notice: "Todo item deleted!"
  end

  private
  def set_todo_list
    @todo_list = TodoList.find(params[:todo_list_id])
  end

  def todo_item_params
    params.require(:todo_item).permit(:task_title, :description, :due_date, :done)
  end
end
