# == Schema Information
#
# Table name: up_files
#
#  id              :integer          not null, primary key
#  file_name       :string
#  site_id         :integer
#  catalog_item_id :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class UpFile < ActiveRecord::Base

  mount_uploader :file_name, UpFilesUploader
  
  belongs_to :catalog_item

end
