# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  blog_id    :integer
#  title      :string
#  body       :text
#  slug       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  summary    :text
#  post_img   :string
#

class Post < ActiveRecord::Base

  belongs_to :blog

  mount_uploader :post_img, PostImgUploader

  validates :title,  uniqueness: { scope: :blog_id,
    message: "Пост должен иметь уникальное имя" }

  extend FriendlyId
  friendly_id :title, use: :slugged

  def should_generate_new_friendly_id?
    slug.blank? || title_changed?
  end

end
