class CreateSites < ActiveRecord::Migration
  def change
    create_table :sites do |t|
      t.string :domain
      t.string :sub_domain
      t.string :name
      t.integer :user_id

      t.timestamps
    end
  end
end
