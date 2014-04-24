module PagesHelper

  def is_front?
    if @page
      true if @page.id == current_site.front_page_id
    end
  end
end
