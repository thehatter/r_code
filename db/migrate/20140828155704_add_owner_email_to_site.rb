class AddOwnerEmailToSite < ActiveRecord::Migration
  def change
    add_column :sites, :owner_email, :string
  end
end
