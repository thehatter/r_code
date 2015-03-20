# == Schema Information
#
# Table name: menus
#
#  id         :integer          not null, primary key
#  site_id    :integer
#  title      :string
#  region_id  :integer
#  created_at :datetime
#  updated_at :datetime
#

class Menu < ActiveRecord::Base
  belongs_to :site
  has_many :menu_items, dependent: :destroy
  has_many :pages, dependent: :destroy
  has_many :catalogs, dependent: :destroy
  has_many :blogs, dependent: :destroy
end
