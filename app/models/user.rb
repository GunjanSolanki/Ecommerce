class User < ApplicationRecord
  has_one :shopping_cart, dependent: :destroy
  has_many :orders, dependent: :destroy

  validates :name, presence: true, length: { maximum: 10 } 
  validates :email, uniqueness: true
  validates :address, presence: true
  validates :password, presence: true, confirmation: true

  enum gender: [:male, :female]
  has_secure_password

  after_save :create_shopping_cart

  def create_shopping_cart
    @shopping_cart = ShoppingCart.create(user_id: self.id)
  end

end

