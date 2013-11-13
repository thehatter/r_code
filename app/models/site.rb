# == Schema Information
#
# Table name: sites
#
#  id            :integer          not null, primary key
#  domain        :string(255)
#  sub_domain    :string(255)
#  name          :string(255)
#  user_id       :integer
#  front_page_id :integer
#  created_at    :datetime
#  updated_at    :datetime
#

class Site < ActiveRecord::Base
  has_many :pages, dependent: :destroy
  has_many :menus, dependent: :destroy
  belongs_to :user
end
