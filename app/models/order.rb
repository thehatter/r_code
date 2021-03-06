# == Schema Information
#
# Table name: orders
#
#  id         :integer          not null, primary key
#  name       :string
#  address    :string
#  email      :string
#  created_at :datetime
#  updated_at :datetime
#  user_id    :integer
#  site_id    :integer
#

class Order < ActiveRecord::Base
	validates_presence_of :name
	validates_presence_of :address
	validates_presence_of :email

  belongs_to :user
	has_many :line_items, dependent: :destroy

	def add_line_items_from_cart(cart)
		cart.line_items.each do |item|
			item.cart_id = nil
			line_items << item
		end
	end
end
