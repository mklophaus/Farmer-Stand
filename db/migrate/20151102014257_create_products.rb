class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.string :type
      t.string :price
      t.string :taste_description
      t.string :quantity

      t.timestamps null: false
    end
  end
end
