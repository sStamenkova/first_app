class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
  	devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:username, :email, :password, :password_confimation,:avatar, :avatar_cache) }
	devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:username, :email, :password, :password_confimation, :current_password, :avatar, :avatar_cache)}  
  end

end
