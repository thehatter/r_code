class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.integer :catalog_id
      t.string :title
      t.string :slug
      
      t.integer :weight

      t.timestamps
    end
  end
end
