class AddCurrencyToLineItems < ActiveRecord::Migration
  def change
    add_column :line_items, :currency, :string
  end
end
