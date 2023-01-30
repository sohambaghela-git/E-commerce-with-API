class CartController < ApplicationController

  def index
  end

  def create
    cart = Cart.new(cart_params)
    cart.user_id = $current_user.id
    cart.save
    render json: { cart: cart, message: " product Added in cart " }
  end

  private 

  def cart_params
    params.require(:cart).permit!
  end

end
