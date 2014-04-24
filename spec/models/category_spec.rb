# == Schema Information
#
# Table name: categories
#
#  id           :integer          not null, primary key
#  catalog_id   :integer
#  title        :string(255)
#  category_img :string(255)
#  slug         :string(255)
#  weight       :integer
#  created_at   :datetime
#  updated_at   :datetime
#

require 'spec_helper'

describe Category do
  pending "add some examples to (or delete) #{__FILE__}"
end
