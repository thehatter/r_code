# == Schema Information
#
# Table name: blogs
#
#  id         :integer          not null, primary key
#  site_id    :integer
#  menu_id    :integer
#  title      :string
#  slug       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Blog, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
