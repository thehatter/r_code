class CreateCatalogs < ActiveRecord::Migration
  def change
    create_table :catalogs do |t|
      
      t.integer :site_id
      t.integer :menu_id
      t.string :title
      t.string :link_title
      t.string :slug


      t.timestamps
    end

    add_index :catalogs, :site_id
    add_index :catalogs, :menu_id
    add_index :catalogs, :slug
  end
end
