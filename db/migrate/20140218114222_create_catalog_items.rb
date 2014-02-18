class CreateCatalogItems < ActiveRecord::Migration
  def change
    create_table :catalog_items do |t|
      t.integer :category_id
      t.string :title
      t.string :slug
      t.integer :price
      t.integer :weight

      t.timestamps
    end
  end
end
