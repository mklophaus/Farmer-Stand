class User < ActiveRecord::Base
  has_secure_password
  has_many :orders
  has_many :products, through: :orders

  validates :email, presence: true, uniqueness: true
end
