class ShoppingCart < ApplicationRecord
  belongs_to :user
  validates_uniqueness_of :user_id
  
  has_many :shopping_cart_products, dependent: :destroy
  has_many :products, through: :shopping_cart_products
  
end
