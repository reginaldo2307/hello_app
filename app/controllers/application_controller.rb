class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  # Chama os parâmetros configurados
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  
  # protect the database, while allowing these fields to be updated.
  protected 

  def configure_permitted_parameters
    devise_parameter_sanitizer.sanitize(:sign_up) { |u| u.permit(:username, :email, :password, :password_confirmation, :remember_me) }
    devise_parameter_sanitizer.sanitize(:sign_in) { |u| u.permit(:login, :username, :email, :password, :remember_me) }
    devise_parameter_sanitizer.sanitize(:account_update) { |u| u.permit(:username, :email, :password, :password_confirmation, :current_password) }
  end
  
end
