# == Schema Information
#
# Table name: up_files
#
#  id              :integer          not null, primary key
#  file_name       :string
#  site_id         :integer
#  catalog_item_id :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'rails_helper'

RSpec.describe UpFile, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
