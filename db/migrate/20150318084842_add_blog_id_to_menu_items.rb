class AddBlogIdToMenuItems < ActiveRecord::Migration
  def change
    add_column :menu_items, :blog_id, :integer
  end
end
