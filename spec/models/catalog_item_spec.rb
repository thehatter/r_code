# == Schema Information
#
# Table name: catalog_items
#
#  id               :integer          not null, primary key
#  category_id      :integer
#  title            :string(255)
#  body             :text
#  catalog_item_img :string(255)
#  slug             :string(255)
#  price            :integer
#  weight           :integer
#  created_at       :datetime
#  updated_at       :datetime
#

require 'spec_helper'

describe CatalogItem do
  pending "add some examples to (or delete) #{__FILE__}"
end
