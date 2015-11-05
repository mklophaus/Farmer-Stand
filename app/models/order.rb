class Order < ActiveRecord::Base
  belongs_to :purchaser, foreign_key: "user_id"
  has_many :products
  has_many :farmers, through: :products

end
