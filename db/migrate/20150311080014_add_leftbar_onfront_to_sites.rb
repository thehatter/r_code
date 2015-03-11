class AddLeftbarOnfrontToSites < ActiveRecord::Migration
  def change
    add_column :sites, :leftbar_onfront, :boolean
  end
end
