class Product < ActiveRecord::Base
  belongs_to :order
  has_many :users, through: :orders

  def price
  end


end
