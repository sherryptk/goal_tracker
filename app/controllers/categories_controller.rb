class CategoriesController < ApplicationController

  def show
    @category = Category.find(params[:id])
    @goals = @category.goal_by_category
  end

end
