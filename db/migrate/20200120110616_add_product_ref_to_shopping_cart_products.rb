class AddProductRefToShoppingCartProducts < ActiveRecord::Migration[6.0]
  def change
    add_reference :shopping_cart_products, :product, null: false, foreign_key: true
  end
end
