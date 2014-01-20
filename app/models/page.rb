# == Schema Information
#
# Table name: pages
#
#  id         :integer          not null, primary key
#  site_id    :integer
#  menu_id    :integer
#  title      :string(255)
#  link_title :string(255)
#  slug       :string(255)
#  body       :text
#  created_at :datetime
#  updated_at :datetime
#

class Page < ActiveRecord::Base
  belongs_to :site
  belongs_to :menu
end
