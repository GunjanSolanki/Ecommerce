module Cart
  include ActiveSupport::Concern

  def add_product_to_cart
    @shopping_cart_product = ShoppingCartProduct.create(shopping_cart_id: current_cart.id, product_id: params[:id])
    redirect_to shopping_carts_path(current_cart.products)
  end

  def remove_product_from_cart
    @shopping_cart_product = ShoppingCartProduct.find_by(shopping_cart_id: current_cart.id, product_id: params[:id])
    @shopping_cart_product.destroy
    redirect_to shopping_carts_path(current_cart.products)
  end

end