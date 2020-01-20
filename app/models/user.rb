class User < ApplicationRecord
  has_one :shopping_cart
  has_many :orders

  validates :name, presence: true, length: { maximum: 10 } 
  validates :email, uniqueness: true
  validates :address, presence: true
  validates :password, presence: true, confirmation: true

  enum gender: [:male, :female]
  has_secure_password
end



