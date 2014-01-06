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

  end
end
