class GoalsController < ApplicationController

  def new
  end
  def create
    Goal.create(goal_params)
  end

  def show

  end

  private

 def goal_params
   params.require(:goal).permit(:title, :category_name, :content)
 end

end
