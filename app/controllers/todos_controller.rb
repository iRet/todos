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
      format.xml { render :xml => @todos }
    end
  end

  def create
    @todo = current_user.todos.new params[:todo]
    if @todo.save
      respond_to do |format|
        format.xml { render :xml => @todo }
        format.js
      end
    else
      flash[:alert] = "Something going wrong"
      respond_to do |format|
        format.xml { render :xml => @todo.errors.messages }
        format.js
      end
    end
  end

  def update
    @todo = current_user.todos.find params[:id]

    respond_to do |format|
      format.xml { head :ok }
      format.js
    end
  end

  def destroy
    @todo = current_user.todos.find params[:id]
    @todo.destroy

    respond_to do |format|
      format.xml { head :ok }
      format.js
    end
  end
end
