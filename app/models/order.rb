class Order < ActiveRecord::Base
  belongs_to :purchaser
  has_many :products
  has_many :farmers, through: :products

end
