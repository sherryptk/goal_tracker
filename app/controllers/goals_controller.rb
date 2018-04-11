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

    if @goal
      redirect_to @goal
    else
      render :new
    end
  end

  def show
    @uncompleted_tasks = current_user.uncompleted_tasks
  end

  def edit
  end

  def update
    @goal.update(goal_params)

   if @goal.save
     redirect_to goal_path(@goal)
   else
     render :edit
   end
   end

   def destroy
     @goal.destroy
     redirect_to goals_path(@goal)
   end



  private

  def set_goal
     @goal = Goal.find(params[:id])
   end

 def goal_params
   params.require(:goal).permit(:title, :description, category_ids:[], categories_attributes: [:name])
 end

end
