class CartController < ApplicationController

  def index
    cart = @current_user.cart
    cart_item = CartItem.where(cart_id: cart.id)
    render json: cart_item
  end

end
