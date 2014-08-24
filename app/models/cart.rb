# == Schema Information
#
# Table name: carts
#
#  id         :integer          not null, primary key
#  created_at :datetime
#  updated_at :datetime
#

class Cart < ActiveRecord::Base
	has_many :line_items, dependent: :destroy

	def add_catalog_item(catalog_item_id, currency)
		current_item = line_items.find_by_catalog_item_id(catalog_item_id)
		if current_item
			current_item.quantity += 1
		else
			current_item = line_items.build(catalog_item_id: catalog_item_id, currency: currency)
		end
		current_item
	end

	def total_price
		line_items.to_a.sum { |item| item.total_price }
	end
end
