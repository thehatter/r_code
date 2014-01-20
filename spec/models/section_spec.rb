# == Schema Information
#
# Table name: sections
#
#  id         :integer          not null, primary key
#  catalog_id :integer
#  section_id :integer
#  name       :string(255)
#  slug       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

require 'spec_helper'

describe Section do
  pending "add some examples to (or delete) #{__FILE__}"
end
