# == Schema Information
#
# Table name: line_items
#
#  id              :integer          not null, primary key
#  catalog_item_id :integer
#  cart_id         :integer
#  created_at      :datetime
#  updated_at      :datetime
#

class LineItem < ActiveRecord::Base
	belongs_to :catalog_item
	belongs_to :order
	belongs_to :cart

	def total_price
		catalog_item.price * quantity
	end
end
