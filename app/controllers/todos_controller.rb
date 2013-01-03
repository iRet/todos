class TodosController < ApplicationController
  def new
    @todo = current_user.todos.new
    render layout: false
  end

  def edit
    @todo = current_user.todos.find params[:id]
    render layout: false
  end

  def index
    @todos = current_user.todos.order('priority DESC').all
    @todo = current_user.todos.new

    respond_to do |format|
      format.html
    end
  end

  def create
    @todo = current_user.todos.new params[:todo]
    if @todo.save
      flash[:notice] = "Successfuly created"
    else
      flash[:notice] = "Something going wrong on creation"
    end
    respond_to do |format|
      format.js
    end
  end

  def update
    @todo = current_user.todos.find params[:id]
    if @todo.update_attributes params[:todo]
      flash[:notice] = "Successfuly updated"
    else
      flash[:notice] = "Something going wrong on updating"
    end
    respond_to do |format|
      format.js
    end
  end

  def destroy
    @todo = current_user.todos.find_by_id params[:id]

    if @todo
      @todo.destroy
      flash[:notice] = "Successfuly deleted"
    else
      flash[:notice] = "Not found"
    end

    respond_to do |format|
      format.js
    end
  end
end
