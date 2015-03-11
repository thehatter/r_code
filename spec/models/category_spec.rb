# == Schema Information
#
# Table name: categories
#
#  id           :integer          not null, primary key
#  catalog_id   :integer
#  site_id      :integer
#  title        :string
#  category_img :string
#  slug         :string
#  weight       :integer
#  created_at   :datetime
#  updated_at   :datetime
#

require 'spec_helper'

describe Category do
  pending "add some examples to (or delete) #{__FILE__}"
end
