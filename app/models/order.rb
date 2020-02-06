class Order < ApplicationRecord
  belongs_to :user
  has_many :order_products, dependent: :destroy
  has_many :products, through: :order_products

  validates :amount, presence: :true
  enum order_status: { confirmed: 1, pending: 2, delivered: 3, cancelled: 4, returned: 5 }

  scope :most_recent, -> { order(created_at: :desc) }
end
