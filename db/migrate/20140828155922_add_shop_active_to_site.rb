class AddShopActiveToSite < ActiveRecord::Migration
  def change
    add_column :sites, :shop_active, :boolean, default: false
  end
end
