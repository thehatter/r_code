module MenusHelper

  def menu_in_block_on_front(id)
    @menu = current_site_menus.find_by region_id: id
    @menu.show_on_front && is_front
  end
end
