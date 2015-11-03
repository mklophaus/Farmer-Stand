class AddFarmerAttributesToUser < ActiveRecord::Migration
  def change
    add_column :users, :type, :string
    add_column :users, :business_name, :string
    add_column :users, :postal_code, :string
  end
end
