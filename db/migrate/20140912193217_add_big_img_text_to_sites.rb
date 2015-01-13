class AddBigImgTextToSites < ActiveRecord::Migration
  def change
    add_column :sites, :big_image_text, :string
  end
end
