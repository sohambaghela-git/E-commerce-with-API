class ProductsController < ApplicationController
  # To get the particular Product at Action
  before_action :set_product, only: %i[show destroy update]
  before_action :seller, only: %i[show update destroy]
		
  def index
    products = Product.all
		render json: products
  end

  def show
		render json: @product
  end

  def create
    product = Product.new(product_params)
	  product.user_id = @current_user.id

		if product.save
	    render json: {product: product, message: "Your product is added"}
		else
		  render json: {product: product, message: "You are not valid to add product"}
		end
  end

  def destroy
		if authorize_user
		  @product.destroy
		  render json: { message: "Your product was destroyed successfully", status: :ok}
		else
		  render json: { message: "You can not destroy this product", status: :unprocessable_entity}
		end
  end

  def update
		if authorize_user
		  @product.update(product_params)
		  render json: { product: @product, message: "Product updated Successfully", status: :ok }
		else
		  render json:  {message: "Sorry you can not update this product ", status: :unprocessable_entity }
		end
  end

  private

  def product_params
		params.require(:product).permit(:name, :detail, :price, :user_id)
  end

  def set_product
		@product = Product.find(params[:id])
  end
		
end
