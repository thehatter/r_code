class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.integer :site_id
      t.integer :menu_id
      t.string :title
      t.text :body

      t.timestamps
    end

    add_index :pages, :site_id
    add_index :pages, :menu_id
  end
end
