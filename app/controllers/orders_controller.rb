class OrdersController < ApplicationController
  def index
    @orders = Order.all
    render json: @orders 
  end
  def create
    @article = Product.find(params[:product_id])
    @order = Orders.create(order_params)
    render json: @order
  end
end 
