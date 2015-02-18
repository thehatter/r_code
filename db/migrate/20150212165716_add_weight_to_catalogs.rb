class AddWeightToCatalogs < ActiveRecord::Migration
  def change
    add_column :catalogs, :weight, :integer
  end
end
