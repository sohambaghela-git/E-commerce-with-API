class UsersController < ApplicationController
	before_action :set_user, only: [:show, :destroy, :update]
	skip_before_action :authenticate_request, only: [:create]
	# before_action :current_user, only: [:index, :destroy, :update]
	after_action :create_unique_cart, only: [:create]

	def index
		users = User.all
		render json: {users: users, current_user: @current_user }
	end

	def show
		if (params[:id].to_i) == (@current_user.id)
			render json: @user
		else
			render json: " Sorry You can not "
		end
	end

	def create
		@user = User.new(user_params)
		if @user.save 
			data = @user.id 
			render json: @user, status: :created
		else
			render json: {message: "this is unappropriate"}, status: :unprocessble_entity
		end
	end

	def destroy
		@user.destroy 
		render json: "User has been Deleted"
	end

	def update
		@user.update(user_params)
		render json: @user	
	end

	private

	def user_params
		params.require(:user).permit(:first_name, :last_name, :email, :mobile, :gender, :password, :password_confirmation, :role)
	end

	def set_user
		@user = User.find(params[:id])
	end

end
