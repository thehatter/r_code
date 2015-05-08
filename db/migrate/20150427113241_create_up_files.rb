class CreateUpFiles < ActiveRecord::Migration
  def change
    create_table :up_files do |t|
      t.string :file_name
      t.integer :site_id
      t.integer :catalog_item_id

      t.timestamps null: false
    end
    add_index :up_files, :site_id
    add_index :up_files, :catalog_item_id
  end
end
