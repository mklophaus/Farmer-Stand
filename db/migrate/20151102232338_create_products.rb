class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.string :category
      t.float  :price
      t.string :taste_description
      t.integer :quantity
     # t.reference :user


      t.timestamps null: false
    end
  end
end
