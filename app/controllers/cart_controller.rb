class CartController < ApplicationController

  def index
    cart = @current_user.cart
    cart_item = Cart_Item.where(cart_id: cart)
  end
 
end
