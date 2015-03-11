class ChangeTableMenus < ActiveRecord::Migration
  def change
    remove_column :menus, :show_on_front
  end
end
