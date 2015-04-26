# == Schema Information
#
# Table name: menu_items
#
#  id         :integer          not null, primary key
#  page_id    :integer
#  menu_id    :integer
#  catalog_id :integer
#  weight     :integer
#  link       :string
#  title      :string
#  created_at :datetime
#  updated_at :datetime
#  blog_id    :integer
#

class MenuItem < ActiveRecord::Base
  # before_update :update_item
  validates_presence_of :title
  validates_presence_of :link

  belongs_to :menu
  belongs_to :page
  belongs_to :catalog
  belongs_to :blog

  # def update_item
  #   if self.page_id
  #     @page = self.page
  #     self.title = @page.title
  #     self.link = page_url(@page)
  #   else
  #     self.title = self.catalog.title
  #     self.link = catalog_url(self.catalog)
  #   end
  # end

end
