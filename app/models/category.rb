# == Schema Information
#
# Table name: categories
#
#  id           :integer          not null, primary key
#  catalog_id   :integer
#  site_id      :integer
#  title        :string(255)
#  category_img :string(255)
#  slug         :string(255)
#  weight       :integer
#  created_at   :datetime
#  updated_at   :datetime
#

class Category < ActiveRecord::Base

  validates_presence_of :title

  belongs_to :catalog
  belongs_to :site
  has_many :catalog_items, dependent: :destroy

  mount_uploader :category_img, CategoryImgUploader

  def should_generate_new_friendly_id?
    slug.blank? || title_changed?
  end

  extend FriendlyId
  # friendly_id :slug_candidates, use: :slugged
  friendly_id :slug_candidates, :use => :scoped, :scope => :site


  def slug_candidates
    [
      :title,
      [:title, Random.rand(1..10)],
      [:title, Random.rand(10..99)]
    ]
  end

  def recreate_category_v
    Category.find_each do |user|
      user.category_img.recreate_versions! if user.category_img?
    end
  end

end
