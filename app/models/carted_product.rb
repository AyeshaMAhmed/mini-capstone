class CartedProduct < ApplicationRecord
  belongs_to :order
  belongs_to :product
  has_many :carted_product
 
end
