class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def index
    @goal = Goal.find(params[:goal_id])
  end

  def new
    @task = Task.new(goal_id: params[:goal_id])
  end

  def create
    @task = Task.create(task_params.merge(user_id: current_user.id))

    if @task.save
      redirect_to @task, notice: 'Task was successfully created.'
    else
      redirect_to new_task_path, notice: 'Please try again. Be sure to fill in all fields.'
    end
  end

  def show
  end

  def edit
  end

  def update
    @task.update(task_params)

    if @task.save
      redirect_to task_path(@task), notice: 'Task was successfully updated.'
    else
      redirect_to edit_task_path(@task), notice: 'Be sure not to leave any fields blank.'
    end
  end

  def destroy
    @task.delete
    redirect_to goal_path(@task.goal_id), notice: 'Task was successfully deleted.'
  end

  def complete
    task = Task.find(params[:id])
    task.update(:completed => true)
    redirect_to task_path(task)
  end

  private
  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:description, :due_date, :completed, :goal_id, :user_id, :id)
  end

end
