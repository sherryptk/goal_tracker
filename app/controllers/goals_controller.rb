class GoalsController < ApplicationController

  def index
    @goals = Goal.all
  end

  def new
    @goal = Goal.new
  end

  def create
    @goal = Goal.create(goal_params)
    redirect_to @goal
  end

  def show
    @goal = Goal.find(params[:id])
  end

  def edit
    @goal = Goal.find(params[:id])
  end

  def update
    @goal = Goal.find(params[:id])
    @goal.update(goal_params)

   if @goal.save
     redirect_to goal_path(@goal)
   else
     render :edit
   end

  end

  private

 def goal_params
   params.require(:goal).permit(:title, :description, category_ids:[], categories_attributes: [:name])
 end

end
