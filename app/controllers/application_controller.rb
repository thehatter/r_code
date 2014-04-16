class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :configure_permitted_parameters, if: :devise_controller?


private
# request.host != 'r-code-main.com' && request.domain != 'lvh.me'

  def current_site
    if request.domain == 'snowboarding.by'#'snowboarding.by' #|| request.domain = 'lvh.me'
      if request.subdomain.present?
        @site = Site.where('sub_domain = ?', request.subdomain.sub(/^www./,'')).first!
      else
        @site = nil
      end
    else 
      @site = Site.where('domain = ?', request.domain).first!
    end
  end

  helper_method :current_site

  def correct_user
    if authenticate_user!
      begin
        @corect_site = current_user.sites.find(current_site)
      rescue ActiveRecord::RecordNotFound
        if current_user.admin?
        else
          redirect_to root_url
          flash[:error] = "current_user is not fk admin!"
        end
      end
    else
      redirect_to root_url
      flash[:error] = "current_user is not registred!"
    end
  end

  helper_method :correct_user


  def current_site_menus
    @menus = current_site.menus if current_site.menus
  end

  helper_method :current_site_menus


  def current_url
    request.protocol + request.host_with_port
  end
  
  helper_method :current_url

protected

  def configure_permitted_parameters
   devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:username, :login, :email, :password, :password_confirmation) }
   devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:username, :login, :email, :password, :password_confirmation) }
   devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:username, :login, :email, :password, :password_confirmation, :current_password) }
  end

end