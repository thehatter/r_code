class AddImageSlot1ToSites < ActiveRecord::Migration
  def change
    add_column :sites, :image_slot_1, :string
  end
end
