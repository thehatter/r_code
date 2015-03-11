# == Schema Information
#
# Table name: sections
#
#  id         :integer          not null, primary key
#  catalog_id :integer
#  section_id :integer
#  name       :string
#  slug       :string
#  created_at :datetime
#  updated_at :datetime
#

class Section < ActiveRecord::Base
  belongs_to :catalog
  belongs_to :section
  has_many :sections
end
