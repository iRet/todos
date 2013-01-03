class Api::TodosController < ApplicationController

  def index
    @todos = current_user.todos.order('priority DESC').all

    render :xml => @todos
  end

  def create
    @todo = current_user.todos.new params[:todo]
    if @todo.save
      head :ok
    else
      render :xml => @todo.errors.messages
    end
  end

  def update
    @todo = current_user.todos.find params[:id]

    if @todo.update_attributes params[:todo]
       head :ok
    else
      render :xml => @todo.errors.messages
    end
  end

  def destroy
    @todo = current_user.todos.find_by_id params[:id]

    if @todo
      @todo.destroy
      head :ok
    else
      head :status => 404
    end
  end
end
