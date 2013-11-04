class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :configure_permitted_parameters, if: :devise_controller?


private

  def current_site
    @site = Site.where('domain = ?', request.host).first!
  end
  helper_method :current_site

protected

  def configure_permitted_parameters
   devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:username, :login, :email, :password, :password_confirmation) }
   devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:username, :login, :email, :password, :password_confirmation) }
   devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:username, :login, :email, :password, :password_confirmation, :current_password) }
  end

end