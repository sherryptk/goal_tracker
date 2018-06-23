class GoalsController < ApplicationController
  before_action :set_goal, only: [:show, :edit, :update, :destroy]

  def index
    @goals = Goal.all
    respond_to do |f|
      f.html { render :index }
      f.json { render json: @goals }
    end
  end

  def new
    @goal = Goal.new
  end

  def create
    @goal = Goal.create(goal_params.merge(user_id: current_user.id))
    render json: @goal, status: 201
  end

  def show
    @uncompleted_tasks = @goal.uncompleted_tasks
    @past_due = @goal.past_due
    respond_to do |f|
      f.html { render :show }
      f.json { render json: @goal }
    end
  end

  def edit
  end

  def update
    @goal.update(goal_params)

    if @goal.save
      redirect_to goal_path(@goal), notice: 'Goal was successfully updated.'
    else
      redirect_to edit_goal_path(@goal), notice: 'Be sure not to leave any fields blank.'
    end
  end

  def destroy
    @goal.delete
    respond_to do |f|
      f.html { render :index }
      f.json { render json: @goal }
    end
  end

  private

  def set_goal
    @goal = Goal.find(params[:id])
  end

  def goal_params
    params.require(:goal).permit(:title, :description, category_ids:[], categories_attributes: [:id, :name])
  end

end
