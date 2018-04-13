class WelcomeController < ApplicationController

  def index
    render :layout => false
  end

  def home
    if current_user
      render :home
    else
      redirect_to root_path, notice: 'You must be logged in to view that page.'
    end
  end

end
