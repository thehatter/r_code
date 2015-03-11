# == Schema Information
#
# Table name: catalogs
#
#  id         :integer          not null, primary key
#  site_id    :integer
#  menu_id    :integer
#  title      :string
#  link_title :string
#  slug       :string
#  created_at :datetime
#  updated_at :datetime
#  weight     :integer
#

class Catalog < ActiveRecord::Base

  validates_presence_of :title

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
