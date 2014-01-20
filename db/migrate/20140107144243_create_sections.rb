class CreateSections < ActiveRecord::Migration
  def change
    create_table :sections do |t|

      t.integer :catalog_id
      t.integer :section_id

      t.string :name
      t.string :slug


      t.timestamps
    end
  end
end
