class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.integer :blog_id
      t.string :title
      t.text :body
      t.string :slug

      t.timestamps null: false
    end
  end
end
