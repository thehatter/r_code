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

class Menu < ActiveRecord::Base
  belongs_to :site
  has_many :menu_items
  has_many :pages
  has_many :catalogs
end
