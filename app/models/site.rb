# encoding: utf-8
# == Schema Information
#
# Table name: sites
#
#  id              :integer          not null, primary key
#  domain          :string
#  sub_domain      :string
#  name            :string
#  site_logo       :string
#  user_id         :integer
#  front_page_id   :integer
#  footer_text     :text
#  created_at      :datetime
#  updated_at      :datetime
#  image_slot_1    :string
#  theme           :string
#  owner_email     :string
#  shop_active     :boolean          default(FALSE)
#  big_image_text  :string
#  leftbar_onfront :boolean
#  currency        :string           default("BYR")
#

class Site < ActiveRecord::Base

  Site::THEMES = %w(white portfolio)
  validates :theme, inclusion: {in: Site::THEMES}

  Site::CURRENCIES = %w(BYR USD RUB UAH)
  validates :currency, inclusion: {in: Site::CURRENCIES}

  after_create :init_site
  before_save :create_subowner

  has_many :pages, dependent: :destroy
  has_many :menus, dependent: :destroy
  has_many :catalogs, dependent: :destroy
  has_many :categories, dependent: :destroy
  has_many :catalog_items, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :blogs, dependent: :destroy

  belongs_to :user


  mount_uploader :site_logo, SiteLogoUploader
  mount_uploader :image_slot_1, ImageSlotOneUploader


  def create_site_static_symlink
    File.symlink("#{Rails.root}/public/sites/#{self.id}", "#{Rails.root}/public/sites/#{self.domain}") if self.domain
  end


  def init_site
    #create folder for sites uploads if it not exist
    Dir.mkdir("#{Rails.root}/public/sites") unless File.exists?("#{Rails.root}/public/sites")
    #create folder for current site uploads 
    Dir.mkdir("#{Rails.root}/public/sites/#{self.id}") unless File.exists?("#{Rails.root}/public/sites/#{self.id}")

    # File.symlink("#{Rails.root}/public/sites/#{self.id}", "#{Rails.root}/public/sites/#{self.domain}") if self.domain


    @main_menu = self.menus.create(title: "Главное меню", region_id: 1)
    @side_menu = self.menus.create(title: "Дополнительное меню", region_id: 2)

    #create front page for this site
    @front_page = self.pages.create(title: "Главная страница", body: "Сайт #{self.name} текст главной страницы")
    self.update(front_page_id: @front_page.id)


    #create first catalog
    @catalog = self.catalogs.create(title: "Тестовый каталог 1", menu_id: @side_menu.id)
    @menu_item = MenuItem.create(link: "#", catalog_id: @catalog.id, menu_id: @catalog.menu_id, title: @catalog.title)

    @category_1 = self.categories.new(title: "Тестовый раздел каталога 1", catalog_id: @catalog.id)
    @category_2 = self.categories.new(title: "Тестовый раздел каталога 2", catalog_id: @catalog.id)
    @category_3 = self.categories.new(title: "Тестовый раздел каталога 3", catalog_id: @catalog.id)
    @category_4 = self.categories.new(title: "Тестовый раздел каталога 4", catalog_id: @catalog.id)
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
