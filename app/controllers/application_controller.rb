class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def authenticate_admin
    redirect_to '/', alert: 'Not authorized.' unless current_user && access_whitelist
  end

  private
  def access_whitelist
    current_user.try(:admin?) || current_user.try(:door_super?)
  end
end
