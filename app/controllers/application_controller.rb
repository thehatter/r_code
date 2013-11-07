class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :configure_permitted_parameters, if: :devise_controller?


private

  def current_site
    if request.host != 'r_code_main.com' && request.domain != 'lvh.me'
      @site = Site.where('domain = ?', request.host).first!
    else 
      @site = Site.where('sub_domain = ?', request.subdomain).first!
    end
  end
  helper_method :current_site

  def correct_user
    @corect_site = current_user.sites.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      if current_user.admin?
      else
        redirect_to root_url
        flash[:error] = "current_user is not fk admin!"
      end
  end

  helper_method :correct_user

protected

  def configure_permitted_parameters
   devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:username, :login, :email, :password, :password_confirmation) }
   devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:username, :login, :email, :password, :password_confirmation) }
   devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:username, :login, :email, :password, :password_confirmation, :current_password) }
  end

end