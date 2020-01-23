class Product < ApplicationRecord
  has_many :shopping_cart_products
  has_many :shopping_carts, through: :shopping_cart_products
  has_many :order_products
  has_many :orders, through: :order_products

  validates :description, length: { maximum: 500 }
  validates :price, :quantity, presence: true, numericality: true

end
