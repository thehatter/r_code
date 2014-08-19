class SubOwner < ActiveRecord::Migration
  def change
  	  create_table :sub_owners do |t|
      t.integer  :user_id,		null: false
      t.integer  :site_id,    null: false
      t.datetime :created_at
    end
  end
end
