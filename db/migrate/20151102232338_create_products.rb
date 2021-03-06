class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.string :category
      t.float  :price
      t.string :taste_description
      t.integer :quantity
      t.references :user, index: true, foreign_key: true
      t.references :order, index: true, foreign_key: true


      t.timestamps null: false
    end
  end
end
