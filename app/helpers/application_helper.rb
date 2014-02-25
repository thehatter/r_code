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

  def current_url
    request.protocol + request.host_with_port
  end


end