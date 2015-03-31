class AddCurrencyToSite < ActiveRecord::Migration
  def change
    add_column :sites, :currency, :string, default: "BYR"
  end
end
