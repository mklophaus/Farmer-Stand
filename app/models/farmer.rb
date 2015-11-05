class Farmer < User
  has_many :products, foreign_key: "user_id"
  has_many :orders, through: :products

end
