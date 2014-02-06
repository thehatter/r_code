class CreateMenuItems < ActiveRecord::Migration
  def change
    create_table :menu_items do |t|

      t.integer :page_id
      t.integer :menu_id
      t.integer :catalog_id

      t.integer :weight
      t.string :link
      t.string :title

      t.timestamps
    end
  end
end
