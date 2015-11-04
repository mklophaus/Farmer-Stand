class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :number
      t.string :delivery_location

      t.timestamps null: false
    end
  end
end
