class TasksController < ApplicationController

  def index

  end

  def new
    @task = Task.new(goal_id: params[:goal_id])
  end

  def create

  end

  def edit

  end

  def update

  end

end
