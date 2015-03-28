class AddSiteIdToCkeditorAssets < ActiveRecord::Migration
  def change
    add_column :ckeditor_assets, :site_id, :integer
  end
end
