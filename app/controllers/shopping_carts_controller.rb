class ShoppingCartsController < ApplicationController
  include ShoppingCartsHelper
  before_action :set_cart

  def index
    @products_in_cart = current_cart.products.most_recent
  end

  def add_to_cart
    add_product_to_cart
  end

  def destroy
    remove_product_from_cart
  end

  private

  def set_cart
    @cart = ShoppingCart.find_by(user_id: current_user.id)
  end
end