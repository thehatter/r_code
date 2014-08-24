class AddCurrencyToCatalogItems < ActiveRecord::Migration
  def change
    add_column :catalog_items, :currency, :string
  end
end
