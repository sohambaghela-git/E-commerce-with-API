class ProductsController < ApplicationController
	before_action :set_product, only: %i[show destroy update]
	# before_action :check_seller, only: [:create, :update]
	
	def index
		products = Product.all
		render json: products
	end

	def show 
		product = Product.find(params[:id])
		render json: product
	end

	def create
		@product = Product.new(product_params)
		@product.user_id = $current_user.id
		if $current_user.role.eql?("seller")
			if @product.save
				render json: {product: @product, message: "Your product is added"}
			else
				render json: {product: @product, message: "Sorry you can not add product"}
			end
		else
			render json: {product: @product, message: "You are not valid to add product"}
		end
	end

	def destroy
		if ($current_user.id).eql?(@product.user_id)
			@product.destroy
			render json:  {message: "product destroyed Successfully", status: :ok }
		else
			render json:  {message: "Sorry you can not destroy this product ", status: :unprocessable_entity }
		end
	end

	def update
		if ($current_user.id).eql?(@product.user_id)
			@product.user_id = $current_user.id
			@product.update(product_params)
			render json: { product: @product, message: "product updated Successfully", status: :ok }
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
	
	# def check_seller
	# 	if $current_user.role.eql?("seller")
	# 		# render json: " yeah you can add product"
	# 	else
	# 		# render json: " Sorry you can not add product"
	# 	end
	# end

end
