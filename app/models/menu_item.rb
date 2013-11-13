# == Schema Information
#
# Table name: menu_items
#
#  id         :integer          not null, primary key
#  page_id    :integer
#  menu_id    :integer
#  title      :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class MenuItem < ActiveRecord::Base

  belongs_to :menu
  belongs_to :page

end
