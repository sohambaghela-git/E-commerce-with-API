class CartController < ApplicationController

  def index
    cart = @current_user.cart
    cart_items = CartItem.where(cart_id: cart.id)
    render json: cart_items
  end

end
