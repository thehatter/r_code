class AddShowOnFrontToMenu < ActiveRecord::Migration
  def change
    add_column :menus, :show_on_front, :boolean
  end
end
