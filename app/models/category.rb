# == Schema Information
#
# Table name: categories
#
#  id         :integer          not null, primary key
#  catalog_id :integer
#  title      :string(255)
#  weight     :integer
#  created_at :datetime
#  updated_at :datetime
#

class Category < ActiveRecord::Base
  belongs_to :catalog
  has_many :catalog_items
end
