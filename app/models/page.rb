# encoding: utf-8
# == Schema Information
#
# Table name: pages
#
#  id         :integer          not null, primary key
#  site_id    :integer
#  menu_id    :integer
#  title      :string
#  link_title :string
#  slug       :string
#  body       :text
#  created_at :datetime
#  updated_at :datetime
#

class Page < ActiveRecord::Base

  validates :title, presence: true

  validates :title,  uniqueness: { scope: :site_id,
  message: "Страница должна иметь уникальное имя" }

  extend FriendlyId
  friendly_id :title, use: :slugged

  has_many :menu_items, dependent: :destroy
  belongs_to :site
  belongs_to :menu


  def should_generate_new_friendly_id?
    slug.blank? || title_changed?
  end

end
