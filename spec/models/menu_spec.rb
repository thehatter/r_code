# == Schema Information
#
# Table name: menus
#
#  id            :integer          not null, primary key
#  site_id       :integer
#  title         :string(255)
#  region_id     :integer
#  created_at    :datetime
#  updated_at    :datetime
#  show_on_front :boolean
#

require 'spec_helper'

describe Menu do
  pending "add some examples to (or delete) #{__FILE__}"
end
