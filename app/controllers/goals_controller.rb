class GoalsController < ApplicationController

  def new
    @goal = Goal.new
  end

  def create
    @goal = Goal.create(goal_params)
    redirect_to goal_path(@goal)
  end

  def show
    @goal = Goal.find(params[:id])
  end

  private

 def goal_params
   params.require(:goal).permit(:title, :description, category_ids:[], categories_attributes: [:name])
 end

end
