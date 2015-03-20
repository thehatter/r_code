class CreateBlogs < ActiveRecord::Migration
  def change
    create_table :blogs do |t|
      t.integer :site_id
      t.integer :menu_id
      t.string :title
      t.string :slug

      t.timestamps null: false
    end
  end
end
