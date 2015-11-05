class Product < ActiveRecord::Base
  belongs_to :order
  belongs_to :farmer, foreign_key: "user_id"

  def formatted_price
    "$#{"%.2f" % price}"
  end

end
