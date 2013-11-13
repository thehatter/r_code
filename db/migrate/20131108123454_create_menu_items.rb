class CreateMenuItems < ActiveRecord::Migration
  def change
    create_table :menu_items do |t|

      t.integer :page_id
      t.integer :menu_id

      t.string :title

      t.timestamps
    end
  end
end
