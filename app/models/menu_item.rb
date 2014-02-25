# == Schema Information
#
# Table name: menu_items
#
#  id         :integer          not null, primary key
#  page_id    :integer
#  menu_id    :integer
#  catalog_id :integer
#  weight     :integer
#  link       :string(255)
#  title      :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class MenuItem < ActiveRecord::Base

  belongs_to :menu
  belongs_to :page, dependent: :destroy
  belongs_to :catalog, dependent: :destroy

end
