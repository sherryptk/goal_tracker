class CategoriesController < ApplicationController

  def show
    @category = Category.find(params[:id])
    # render json: @category, status: 200
    @goals = @category.goal_by_category
  end

end
