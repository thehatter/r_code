# encoding: utf-8
# == Schema Information
#
# Table name: sites
#
#  id             :integer          not null, primary key
#  domain         :string(255)
#  sub_domain     :string(255)
#  name           :string(255)
#  site_logo      :string(255)
#  user_id        :integer
#  front_page_id  :integer
#  footer_text    :text
#  created_at     :datetime
#  updated_at     :datetime
#  image_slot_1   :string(255)
#  theme          :string(255)
#  owner_email    :string(255)
#  shop_active    :boolean          default("f")
#  big_image_text :string(255)
#

class Site < ActiveRecord::Base

  Site::THEMES = %w(white minimum)
  validates :theme, inclusion: {in: Site::THEMES}

  after_save :init_site
  before_save :create_subowner

  has_many :pages, dependent: :destroy
  has_many :menus, dependent: :destroy
  has_many :catalogs, dependent: :destroy
  has_many :categories, dependent: :destroy
  has_many :catalog_items, dependent: :destroy
  has_many :orders, dependent: :destroy

  belongs_to :user


  mount_uploader :site_logo, SiteLogoUploader
  mount_uploader :image_slot_1, ImageSlotOneUploader


  def init_site
    @main_menu = self.menus.create(title: "Главное меню", region_id: 1)
    @side_menu = self.menus.create(title: "Дополнительное меню", region_id: 2)

    #create front page for this site
    @front_page = self.pages.create(title: "Главная страница", body: "Сайт #{self.name} текст главной страницы")
    self.update(front_page_id: @front_page.id)
  end

  def self.create_random_user
    user = User.create(email: User.generate_email, username: User.generate_login, password: User.generate_password)
  end

  def create_subowner
    user = Site.create_random_user
    subowner = SubOwner.new
    subowner.user_id = user.id
    subowner.site_id = self.id
    subowner.password = user.password
    subowner.save
  end

  def self.get_list_of_owners(site_id)
    user_list = SubOwner.where('site_id = ?', site_id).pluck(:user_id)
  end
end
