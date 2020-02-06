module ShoppingCartsHelper
  def current_cart
    @current_cart = ShoppingCart.find_by(user_id: current_user.id) 
  end

  def add_product_to_cart
    @shopping_cart_product = ShoppingCartProduct.create(shopping_cart_id: current_cart.id, product_id: params[:product_id])
    redirect_to shopping_carts_path
  end

  def remove_product_from_cart
    @shopping_cart_product = ShoppingCartProduct.find_by(shopping_cart_id: params[:id], product_id: params[:product_id])
    @shopping_cart_product.destroy
    redirect_to shopping_carts_path
  end

end
