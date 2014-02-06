# == Schema Information
#
# Table name: menu_items
#
#  id         :integer          not null, primary key
#  page_id    :integer
#  menu_id    :integer
#  catalog_id :integer
#  link       :string(255)
#  title      :string(255)
#  created_at :datetime
#  updated_at :datetime
#

require 'spec_helper'

describe MenuItem do
  pending "add some examples to (or delete) #{__FILE__}"
end
