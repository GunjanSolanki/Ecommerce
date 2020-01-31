module ShoppingCartsHelper
  def current_cart
    if session[:shopping_cart_id] 
      @current_cart ||= ShoppingCart.find(session[:shopping_cart_id])
    else
      @current_cart = nil
    end
  end

end
