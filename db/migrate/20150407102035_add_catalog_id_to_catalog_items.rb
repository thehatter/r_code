class AddCatalogIdToCatalogItems < ActiveRecord::Migration
  def change
    add_column :catalog_items, :catalog_id, :integer
    add_index :catalog_items, :catalog_id
  end
end
