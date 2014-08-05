# encoding: UTF-8
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

  validates_presence_of     :title
  validates_presence_of     :body
  validates_length_of       :title, minimum: 5, too_short: 'Название товара не может быть короче 5 символов'
  validates_length_of       :body, minimum: 10, too_short: 'Название товара не может быть короче 10 символов'
  validates_numericality_of :price


  belongs_to :category
  belongs_to :site

  mount_uploader :catalog_item_img, CatalogItemImgUploader


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

  def should_generate_new_friendly_id?
    slug.blank? || title_changed?
  end

end
