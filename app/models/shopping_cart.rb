class ShoppingCart < ApplicationRecord
  belongs_to :user
  has_many :products, through :shopping_cart_products
end
