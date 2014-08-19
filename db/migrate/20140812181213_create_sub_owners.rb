class CreateSubOwners < ActiveRecord::Migration
  def change
    create_table :sub_owners do |t|

    	t.integer :user_id
    	t.integer :site_id

      t.timestamps
    end
  end
end
