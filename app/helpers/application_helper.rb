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
  # for has_and_belongs_to_many must use current_site.include?(current_user)

end