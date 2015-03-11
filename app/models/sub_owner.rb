# == Schema Information
#
# Table name: sub_owners
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  site_id    :integer
#  password   :string
#  created_at :datetime
#  updated_at :datetime
#

class SubOwner < ActiveRecord::Base
end
