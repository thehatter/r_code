# == Schema Information
#
# Table name: line_items
#
#  id              :integer          not null, primary key
#  catalog_item_id :integer
#  cart_id         :integer
#  created_at      :datetime
#  updated_at      :datetime
#  quantity        :integer          default("1")
#  currency        :string(255)
#  order_id        :integer
#

require 'spec_helper'

describe LineItem do
  pending "add some examples to (or delete) #{__FILE__}"
end
