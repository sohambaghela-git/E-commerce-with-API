class CartItemsController < ApplicationController
  before_action :set_cart_item

  def index
    cart = @current_user.cart
    cart_items = CartItem.where(cart_id: cart.id)
    render json: {cart_item:cart_items, status: :ok}
  end
  def create 
    cart_item = CartItem.new(cart_item_params)
    cart_item.user_id = @current_user.id
    if cart_item.save
      render json: {message: 'Product added into cart', status: :ok}
    else
      render json: {error:cart_item.errors.messages, status: :unprocessable_entity}
    end
  end

  def update
    cart_item = CartItem.find(params[:id])

    if cart_item.update(cart_item_params)
      render json: {message: 'Product updated into cart', status: :ok}
    else
      render json: {error:cart_item.errors.messages, status: :unprocessable_entity}
    end
  end

  def destroy
    if @cart_item.user_id == @current_user.id
      @cart_item.destroy
      render json: {message: 'Product is removed', status: :ok}
    else
      render json: {error:cart_item.errors.messages, status: :unprocessable_entity}
    end
  end

  private 
  
  def set_cart_item
    @cart_item = CartItem.find(params[:id])
  end

  def cart_item_params
    params.require(:cart_item).permit!
  end

end
