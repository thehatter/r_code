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

class Section < ActiveRecord::Base
  belongs_to :catalog
  belongs_to :section
  has_many :sections
end
