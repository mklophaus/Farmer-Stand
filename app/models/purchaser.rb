class Purchaser < User
  has_many :orders, foreign_key: "user_id"
  has_many :products, through: :orders


end
