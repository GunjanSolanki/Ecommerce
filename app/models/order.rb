class Order < ApplicationRecord
  belongs_to :user
  has_many :products, through :order_products

  enum order_status: [:confirmed, :pending]
end
