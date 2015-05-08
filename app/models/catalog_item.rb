# encoding: UTF-8
# == Schema Information
#
# Table name: catalog_items
#
#  id               :integer          not null, primary key
#  category_id      :integer
#  site_id          :integer
#  title            :string
#  body             :text
#  catalog_item_img :string
#  slug             :string
#  price            :integer
#  weight           :integer
#  created_at       :datetime
#  updated_at       :datetime
#  currency         :string
#  catalog_id       :integer
#

class CatalogItem < ActiveRecord::Base

  validates_presence_of     :title
  validates_length_of       :title, minimum: 2, too_short: 'Название товара не может быть короче 2 символов'
  
  validates_numericality_of :price
  validates :price, inclusion: { in: 1..2147483647,
    message: "Цена не может быть больше 2147483647" }


  belongs_to :category
  belongs_to :catalog
  belongs_to :site
  has_many   :line_items
  has_many :up_files, dependent: :destroy

  before_destroy :ensure_not_referenced_by_any_line_item

  CURRENCY = ['USD', 'BYR', 'RUB', 'UAH']

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


  def recreate_catalog_item_v #replace with site img recreate method! for site servise! 
    CatalogItem.find_each do |user|
      user.catalog_item_img.recreate_versions! if user.catalog_item_img?
    end
  end


private

  def ensure_not_referenced_by_any_line_item
    if line_items.empty?
      return true
    else
      errors.add(:base, 'Существуют товарные позиции')
      return false
    end
  end

end
