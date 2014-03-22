# == Schema Information
#
# Table name: categories
#
#  id         :integer          not null, primary key
#  catalog_id :integer
#  title      :string(255)
#  slug       :string(255)
#  weight     :integer
#  created_at :datetime
#  updated_at :datetime
#

class Category < ActiveRecord::Base

  extend FriendlyId
  friendly_id :title, use: :slugged
  
  belongs_to :catalog
  has_many :catalog_items

  mount_uploader :category_img, CategoryImgUploader

  def should_generate_new_friendly_id?
    slug.blank? || title_changed?
  end
  
end
