class Product < ActiveRecord::Base
  belongs_to :order
  belongs_to :farmer
  belongs_to :purchaser, through: :order


  def formatted_price
    "$#{"%.2f" % price}"
  end

end
