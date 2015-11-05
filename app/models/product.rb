class Product < ActiveRecord::Base
  belongs_to :order
  has_many :users, through: :orders

  def formatted_price
    "$#{"%.2f" % price}"
  end

end
