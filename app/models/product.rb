class Product < ApplicationRecord
  belongs_to :shopping_cart
  has_many :shopping_carts, through :shopping_cart_products
  has_many :orders, through :order_products

  validates :description, length: { maximum: 500 }
  validates :price, :quantity, presence: true, numericality: true

end
