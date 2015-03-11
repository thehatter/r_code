# == Schema Information
#
# Table name: catalogs
#
#  id         :integer          not null, primary key
#  site_id    :integer
#  menu_id    :integer
#  title      :string
#  link_title :string
#  slug       :string
#  created_at :datetime
#  updated_at :datetime
#  weight     :integer
#

require 'spec_helper'

describe Catalog do
  pending "add some examples to (or delete) #{__FILE__}"
end
