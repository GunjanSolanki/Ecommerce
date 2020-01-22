class Order < ApplicationRecord
  belongs_to :user
  has_many :order_products
  has_many :products, through: :order_products

  validates :amount, presence: :true
  enum order_status: { confirmed: 1, pending: 2, delivered: 3, returned: 4, exchanged: 5 }
end
