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

require 'spec_helper'

describe Order do
  pending "add some examples to (or delete) #{__FILE__}"
end
