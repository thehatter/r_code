#encoding: UTF-8
class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :configure_permitted_parameters, if: :devise_controller?


private
# request.host != 'r-code-main.com' && request.domain != 'lvh.me' naruzhnayareklama.by

  def current_site
    if request.domain == 'vit.by' #'snowboarding.by'#'snowboarding.by' #|| request.domain = 'lvh.me'
      if request.subdomain != "www"
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
        if owner_user
        else
          redirect_to root_url
          flash[:error] = "#{current_user.username} is not fk admin!"
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

  # метод нужен для доступа админов и хозяев сайтов к редактированию
  def owner_user
    if authenticate_user!
      (current_user.admin? || current_user.id == current_site.user_id || subowner?) ? true : false
    end
  end

  helper_method :owner_user

  def subowner?
    user_id = SubOwner.where('site_id = ?', current_site.id).pluck(:user_id)

    true if user_id.include?(current_user.id)
  end

  helper_method :subowner?


  #TODO recreate more complex cart & use this method http://apidock.com/rails/ActiveRecord/Relation/find_or_create_by
  def current_cart
    Cart.find(session[:cart_id])
  rescue ActiveRecord::RecordNotFound
    cart = Cart.create
    session[:cart_id] = cart.id
    cart
  end
  helper_method :current_cart

  def shop_activate?
    if !current_site.shop_active
      redirect_to root_url
      flash[:error] = "Невозможно"
    end
  end

  helper_method :shop_activate?


protected

  def ckeditor_pictures_scope(options = { :site_id => "#{current_site.id}" })
    ckeditor_filebrowser_scope(options)
  end

  def ckeditor_attachment_files_scope(options = { :site_id => "#{current_site.id}" })
    ckeditor_filebrowser_scope(options)
  end


  def configure_permitted_parameters
   devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:username, :login, :email, :password, :password_confirmation) }
   devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:username, :login, :email, :password, :password_confirmation) }
   devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:username, :login, :email, :password, :password_confirmation, :current_password) }
  end

end