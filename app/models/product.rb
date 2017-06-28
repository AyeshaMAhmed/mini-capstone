class Product < ApplicationRecord

  belongs_to :supplier
  has_many :images
  has_many :orders, through: :carted_products
  has_many :carted_products
  has_many :categories, through: :carted_products

  validates :name, presence: true
  validates :name, uniqueness: true

  validates :price, numericality: true
  validates :price, presence: true

  validates :description, length: {maximum: 500}
  validates :description, presence: true




  def sale_message
    if price.to_i <= 10 
      then "Discount Item"
    else
      return "Everyday Value"
    end
  end

  def tax
    price.to_i * 0.09
  end

  def total
    price.to_i + tax
  end


end


  # class Supplier
  #  def items
  #   item.where(supplier_id: supplier.id)
  #  end
  # end 

  # class Item
  #  def supplier
  #    Farmer.find_by(id: self.farmer_id)
  #  end
  # end



