# == Schema Information
#
# Table name: catalog_items
#
#  id               :integer          not null, primary key
#  category_id      :integer
#  title            :string(255)
#  body             :text
#  catalog_item_img :string(255)
#  slug             :string(255)
#  price            :integer
#  weight           :integer
#  created_at       :datetime
#  updated_at       :datetime
#

class CatalogItem < ActiveRecord::Base
  
  extend FriendlyId
  friendly_id :title, use: :slugged
  
  belongs_to :category

  mount_uploader :catalog_item_img, CatalogItemImgUploader

  def should_generate_new_friendly_id?
    slug.blank? || title_changed?
  end

end
