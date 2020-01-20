class Order < ApplicationRecord
  belongs_to :user
  has_many :products, through :order_products

  validates :amount, presence :true
  enum order_status: [:confirmed, :pending]
end

