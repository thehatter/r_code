module PagesHelper

  def is_front?
    true if @page.id == current_site.front_page_id
  end
end
