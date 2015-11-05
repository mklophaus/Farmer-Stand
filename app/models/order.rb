class Order < ActiveRecord::Base
  belongs_to :purchaser, foreign_key: "user_id"
  has_many :products
  has_many :farmers, through: :products

  after_create :generate_po_number

  def generate_po_number
    self.number = "P#{self.id.to_s.rjust(8, '0')}"
    self.save
  end
end
