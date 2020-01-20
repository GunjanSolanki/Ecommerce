class User < ApplicationRecord
  has_one :shopping_cart
  has_many :orders

  enum gender: [:male, :female]
  has_secure_password
end


