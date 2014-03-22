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
  extend FriendlyId
  friendly_id :title, use: :slugged

  has_many :section
  has_many :menu_items, dependent: :destroy
  has_many :categories, dependent: :destroy
  belongs_to :menu
  belongs_to :site

  def should_generate_new_friendly_id?
    slug.blank? || title_changed?
  end

end
