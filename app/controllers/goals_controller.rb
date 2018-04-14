class GoalsController < ApplicationController

  before_action :set_goal, only: [:show, :edit, :update, :destroy]


  def index
    @goals = Goal.all
  end

  def new
    @goal = Goal.new
  end

  def create
    @goal = Goal.create(goal_params.merge(user_id: current_user.id))

    if @goal.save
      redirect_to @goal, notice: 'Goal was successfully created.'
    else
      redirect_to new_goal_path, notice: 'Please try again, Be sure to fill in all fields.'
    end
  end

  def show
    @uncompleted_tasks = @goal.uncompleted_tasks
  end

  def edit
  end

  def update
    @goal.update(goal_params)

   if @goal.save
     redirect_to goal_path(@goal), notice: 'Goal was successfully updated.'
   else
     render :edit
   end
   end

   def destroy
     @goal.destroy
     redirect_to goals_path(@goal), notice: 'Goal was successfully deleted.'
   end

  private

  def set_goal
     @goal = Goal.find(params[:id])
   end

 def goal_params
   params.require(:goal).permit(:title, :description, category_ids:[], categories_attributes: [:id, :name])
 end

end
