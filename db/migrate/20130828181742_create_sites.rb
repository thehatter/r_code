class CreateSites < ActiveRecord::Migration
  def change
    create_table :sites do |t|
      t.string :domain
      t.string :sub_domain
      t.string :name
      t.string :site_logo
      t.integer :user_id
      t.integer :front_page_id

      t.timestamps
    end

  end
end
