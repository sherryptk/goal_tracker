class TasksController < ApplicationController

  def index

  end

  def new
    @task = Task.new(goal_id: params[:goal_id])
  end

  def create
    # @task = Task.create(task_params.merge(user_id: current_user.id))
    # if @task
    #   current_user.tasks << @task
    # end
    @task = current_user.tasks.build(task_params.merge(user_id: current_user.id))
    @task.save
    redirect_to @task
  end

  def show
    @task = Task.find(params[:id])
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    @task.update(task_params)

   if @task.save
     redirect_to task_path(@task)
   else
     render :edit
   end

 end

  def task_params
    params.require(:task).permit(:description, :due_date, :completed, :goal_id, :user_id)
  end

end