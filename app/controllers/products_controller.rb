class ProductsController < ApplicationController
	before_action :set_product, only: %i[show destroy update]
	
	def index
		products = Product.all
		render json: products
	end
	def show 
		product = Product.find(params[:id])
		render json: product
	end

	def create
		@product = Product.create(product_params)
		render json: @product
	end

	def destroy
		@product.destroy 
		render json:  {message: "product destroyed Successfully" }, status: :ok	
	end

	def update
		@product.update(product_params)
		render json: @product
	end

	private

	def product_params
		params.require(:product).permit(:name, :detail, :price, :user_id)
	end

	def set_product
		@product = Product.find(params[:id])
	end
	
end
