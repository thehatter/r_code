class AddSiteIdToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :site_id, :integer
  end
end
