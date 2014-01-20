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
#

class Catalog < ActiveRecord::Base
  has_many :section
  belongs_to :menu
end
