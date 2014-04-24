# == Schema Information
#
# Table name: sites
#
#  id            :integer          not null, primary key
#  domain        :string(255)
#  sub_domain    :string(255)
#  name          :string(255)
#  site_logo     :string(255)
#  user_id       :integer
#  front_page_id :integer
#  footer_text   :text
#  created_at    :datetime
#  updated_at    :datetime
#  image_slot_1  :string(255)
#  theme         :string(255)
#

class Site < ActiveRecord::Base

  Site::THEMES = %w(white portfolio)
  validates :theme, inclusion: {in: Site::THEMES}

  after_save :init_site

  has_many :pages, dependent: :destroy
  has_many :menus, dependent: :destroy
  has_many :catalogs, dependent: :destroy
  belongs_to :user


  mount_uploader :site_logo, SiteLogoUploader
  mount_uploader :image_slot_1, ImageSlotOneUploader


  def init_site
    @main_menu = self.menus.create(title: "Главное меню", block_id: 1)

    #create front page for this site
    @front_page = self.pages.create(title: "Главная страница", body: "Сайт #{self.name} текст главной страницы")
    self.update(front_page_id: @front_page.id)

  end

end
