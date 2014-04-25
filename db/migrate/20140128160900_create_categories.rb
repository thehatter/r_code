class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.integer :catalog_id
      t.integer :site_id
      t.string :title
      t.string :category_img
      t.string :slug
      
      t.integer :weight

      t.timestamps
    end
  end
end
