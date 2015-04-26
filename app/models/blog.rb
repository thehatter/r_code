# == Schema Information
#
# Table name: blogs
#
#  id         :integer          not null, primary key
#  site_id    :integer
#  menu_id    :integer
#  title      :string
#  slug       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Blog < ActiveRecord::Base

  belongs_to :site
  belongs_to :menu
  has_many :posts, dependent: :destroy
  has_many :menu_items, dependent: :destroy

end
