module ProductsHelper
  def check_product_in_cart
    ShoppingCartProduct.find_by(shopping_cart_id: current_cart.id, product_id: @product.id)
  end
end