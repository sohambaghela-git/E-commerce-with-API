class CartItemsController < ApplicationController

  def create 
    cart_item = CartItem.new(cart_item_params)
    cart_item.user_id = @current_user.id
    
    if cart_item.save
      render json: {message: "Product added into cart ", status: :ok}
    else
      render json: {message: "Product not added ", status: :unprocessable_entity}
    end
  end

  def update
    cart_item = CartItem.find(params[:id])

    if cart_item.update(cart_item_params)
      render json: {message: "Product updated into cart", status: :ok}
    else
      render json: {message: "Product did not update", status: :unprocessable_entity}
    end
  end

  private 
  
  def cart_item_params
    params.require(:cart_item).permit!
  end

end
