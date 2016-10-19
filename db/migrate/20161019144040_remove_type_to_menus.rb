class RemoveTypeToMenus < ActiveRecord::Migration[5.0]
  def change
    add_column :menus, :category, :string
    remove_column :menus, :type, :string
  end
end
