class ApplicationController < ActionController::Base

  protect_from_forgery :except => [:callback]

  def after_sign_in_path_for(resource_or_scope)
   welcome_path
  end

  def after_sign_out_path_for(resource_or_scope)
    root_path
  end


end
