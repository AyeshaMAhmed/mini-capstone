class CartedProduct < ApplicationRecord
  belongs_to :order
  belongs_to :product
  has_many :carted_product

  validates :quantity, presence: true
  validates :quantity, numericality: {greater_than: 0}

 
end
