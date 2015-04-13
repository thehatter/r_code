class UpdateMenuItmesUrls < ActiveRecord::Migration
  def change
    #migrate to relative paths in menu
    MenuItem.all.each do |item|
      if item.page_id
        item.link = Rails.application.routes.url_helpers.page_path(item.page)
        item.save
      elsif item.catalog_id
        item.link = Rails.application.routes.url_helpers.catalog_path(item.catalog)
        item.save
      else
        item.link = Rails.application.routes.url_helpers.blog_path(item.blog)
        item.save
      end
    end


  end

end
