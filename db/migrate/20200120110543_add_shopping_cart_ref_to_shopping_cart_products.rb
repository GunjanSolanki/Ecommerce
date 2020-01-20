class AddShoppingCartRefToShoppingCartProducts < ActiveRecord::Migration[6.0]
  def change
    add_reference :shopping_cart_products, :shopping_cart, null: false, foreign_key: true
  end
end
