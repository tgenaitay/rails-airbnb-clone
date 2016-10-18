class CreateMenus < ActiveRecord::Migration[5.0]
  def change
    create_table :menus do |t|
      t.string :name
      t.integer :price
      t.text :description
      t.text :starter
      t.text :meal
      t.text :dessert
      t.string :type
      t.integer :portions
      t.date :availability
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
