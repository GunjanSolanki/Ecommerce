class Category < ApplicationRecord
  has_many :products

  enum category: [:clothes, :electronics, :utensils, :stationaries]

  validates :category, inclusion: { in: %w("clothes", "electronics", "utensils","stationaries"),
    message: "%{value} is not a valid category" }
end
