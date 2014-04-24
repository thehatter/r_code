# == Schema Information
#
# Table name: categories
#
#  id           :integer          not null, primary key
#  catalog_id   :integer
#  title        :string(255)
#  category_img :string(255)
#  slug         :string(255)
#  weight       :integer
#  created_at   :datetime
#  updated_at   :datetime
#

class Category < ActiveRecord::Base

  extend FriendlyId
  friendly_id :slug_candidates, use: :slugged
  
  belongs_to :catalog
  has_many :catalog_items, dependent: :destroy

  mount_uploader :category_img, CategoryImgUploader

  def should_generate_new_friendly_id?
    slug.blank? || title_changed?
  end

    def slug_candidates
    [
      :title,
      [:title, Random.rand(1..10)],
      [:title, Random.rand(10..99)]
    ]
  end
  
end
