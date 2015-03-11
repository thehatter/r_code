# == Schema Information
#
# Table name: catalog_items
#
#  id               :integer          not null, primary key
#  category_id      :integer
#  site_id          :integer
#  title            :string
#  body             :text
#  catalog_item_img :string
#  slug             :string
#  price            :integer
#  weight           :integer
#  created_at       :datetime
#  updated_at       :datetime
#  currency         :string
#

require 'spec_helper'

describe CatalogItem do
  pending "add some examples to (or delete) #{__FILE__}"
end
