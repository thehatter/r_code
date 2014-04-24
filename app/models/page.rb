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

  validates :title, presence: true
  
  validates :title,  uniqueness: { scope: :site_id,
  message: "should happen once per year" }


  extend FriendlyId
  friendly_id :title, use: :slugged

  has_many :menu_items, dependent: :destroy
  belongs_to :site
  belongs_to :menu


  def should_generate_new_friendly_id?
    slug.blank? || title_changed?
  end

end
