# == Schema Information
#
# Table name: menu_items
#
#  id         :integer          not null, primary key
#  page_id    :integer
#  menu_id    :integer
#  catalog_id :integer
#  weight     :integer
#  link       :string
#  title      :string
#  created_at :datetime
#  updated_at :datetime
#

require 'spec_helper'

describe MenuItem do
  pending "add some examples to (or delete) #{__FILE__}"
end
