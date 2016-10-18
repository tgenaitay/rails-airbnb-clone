class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.datetime :date
      t.integer :portions
      t.boolean :approved
      t.references :user, foreign_key: true
      t.references :menu, foreign_key: true

      t.timestamps
    end
  end
end
