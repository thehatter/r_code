module ApplicationHelper

  # def current_site_url
  #   if current_site.domain
  #     'http://' + current_site.domain
  #   elsif current_site.sub_domain
  #     'http://' + current_site.sub_domain
  #   else
  #     nil
  #   end
  # end

  # def current_site_url
  #   dom = current_site.domain.presence || current_site.sub_domain.presence
  #   'http://' + dom if dom
  # end

  def correct_view
    true if user_signed_in? && (current_user.admin? ||  current_site.user == current_user)
  end

  def is_front
    @front 
  end 
  # for has_and_belongs_to_many must use current_site.include?(current_user)

  def body_classes
    classes = []
    classes << controller.controller_name
    classes << "shop_activ" if current_site && current_site.shop_active
    classes << "signed_in" if user_signed_in?
    classes << "admin" if user_signed_in? && owner_user

    classes.join(' ')
  end

end