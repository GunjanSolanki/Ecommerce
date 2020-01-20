class CreateShoppingCartProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :shopping_cart_products do |t|

      t.timestamps
    end
  end
end
