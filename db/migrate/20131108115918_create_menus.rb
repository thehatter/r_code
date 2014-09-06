class CreateMenus < ActiveRecord::Migration
  def change
    create_table :menus do |t|

      t.integer :site_id
      t.string :title

      t.integer :region_id

      t.timestamps
    end
  end
end
