# == Schema Information
#
# Table name: catalogs
#
#  id         :integer          not null, primary key
#  site_id    :integer
#  menu_id    :integer
#  title      :string(255)
#  link_title :string(255)
#  slug       :string(255)
#  created_at :datetime
#  updated_at :datetime
#  weight     :integer
#

require 'spec_helper'

describe Catalog do
  pending "add some examples to (or delete) #{__FILE__}"
end
