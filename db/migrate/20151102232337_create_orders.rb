class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :number
      t.string :delivery_location
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
