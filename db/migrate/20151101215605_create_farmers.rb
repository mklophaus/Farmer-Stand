class CreateFarmers < ActiveRecord::Migration
  def change
    create_table :farmers do |t|
      t.string :name
      t.string :business
      t.string :email
      t.string :zip_code
      t.float :rating
      t.string :password_digest

      t.timestamps null: false
    end
  end
end
