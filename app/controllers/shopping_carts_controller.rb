class ShoppingCartsController < ApplicationController
  include ShoppingCartsHelper, Cart
  before_action :set_cart_session
  
  def index
  end

  def add_to_cart
    add_product_to_cart
  end

  def destroy
    remove_product_from_cart
  end

  private
  def set_cart_session
    unless session[:shopping_cart_id]
      session[:shopping_cart_id] = current_user.id
    end
  end

end