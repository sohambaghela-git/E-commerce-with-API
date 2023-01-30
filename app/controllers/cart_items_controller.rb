class CartItemsController < ApplicationController

  def index
  end

  def create 
    debugger
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.user_id = @current_user.id
   
    if @cart_item.save
      render json: {message: "product added into cart ", status: :ok}
    else
      render json: {message: " product not added ", status: :unprocessable_entity}
    end
  end

  private 
  
  def cart_item_params
    params.require(:cart_item).permit!
  end

end
