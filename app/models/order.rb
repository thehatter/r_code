# == Schema Information
#
# Table name: orders
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  address    :string(255)
#  email      :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Order < ActiveRecord::Base
	validates_presence_of :name
	validates_presence_of :address
	validates_presence_of :email

	has_many :line_items, dependent: :destroy

	def add_line_items_from_cart(cart)
		cart.line_items.each do |item|
			item.cart_id = nil
			line_items << item
		end
	end
end
