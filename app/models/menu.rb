# == Schema Information
#
# Table name: menus
#
#  id         :integer          not null, primary key
#  site_id    :integer
#  title      :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Menu < ActiveRecord::Base
  belongs_to :site
  has_many :menu_item
  has_many :pages
end
