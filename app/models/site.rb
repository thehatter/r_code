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
#

class Site < ActiveRecord::Base
  after_save :create_menus

  has_many :pages, dependent: :destroy
  has_many :menus, dependent: :destroy
  has_many :catalogs, dependent: :destroy
  belongs_to :user


  mount_uploader :site_logo, SiteLogoUploader


  def create_menus
    @main_menu = self.menus.create( title: "Главное меню", block_id: 1)
  end

end
