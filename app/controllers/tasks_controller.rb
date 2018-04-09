class TasksController < ApplicationController

  def index

  end

  def new
    @task = Task.new(goal_id: params[:goal_id])
  end

  def create
    @task = Task.create(task_params)
    redirect_to @task
  end

  def show
    @task = Task.find(params[:id])
  end

  def edit

  end

  def update

  end

  def task_params
    params.require(:task).permit(:description, :due_date, :completed, :goal_id)
  end

end
