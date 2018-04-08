class GoalsController < ApplicationController

  def new
  end

  def create
    @goal = Goal.create(goal_params)
    redirect_to goal(@goal)
  end

  def show
    @goal = Goal.find(params[:id])
  end

  private

 def goal_params
   params.require(:goal).permit(:title, :category_name, :description)
 end

end
