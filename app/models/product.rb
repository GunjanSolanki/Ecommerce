class Product < ApplicationRecord
  has_many :shopping_cart_products, dependent: :destroy
  has_many :shopping_carts, through: :shopping_cart_products
  has_many :order_products, dependent: :destroy
  has_many :orders, through: :order_products
  belongs_to :category

  validates :description, length: { maximum: 500 }
  validates :price, :quantity, presence: true, numericality: true
  has_many_attached :images, dependent: :destroy
end
