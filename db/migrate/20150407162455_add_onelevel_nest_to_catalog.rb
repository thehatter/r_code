class AddOnelevelNestToCatalog < ActiveRecord::Migration
  def change
    add_column :catalogs, :onelevel_nest, :boolean, :default => false
    Catalog.update_all ["onelevel_nest = ?", false] #set false for all existed catalogs!s
  end
end