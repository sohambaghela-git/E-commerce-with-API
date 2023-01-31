class UsersController < ApplicationController
	# To get the particular User at Action
	before_action :set_user, only: [:show, :destroy, :update]
	
	# To Make new user to Register on Site
	skip_before_action :authenticate_request, only: [:create]
	
	def index
		users = User.all
		render json: {users: users, status: :ok}
	end

	def show
		if (params[:id].to_i) == (@current_user.id)
			render json: {user: @user, status: :ok}
		else
			render json: {message: "Sorry You can not access this url", status: :unprocessable_entity}
		end
	end

	def create
		user = User.new(user_params)
		if user.save 
			render json: {user: user, status: :ok}
		else
			render json: {message: "Oops! you can not register on site", status: :unprocessble_entity}
		end
	end

	def destroy
		@user.destroy 
		render json: "User has been Deleted"
	end

	def update
		@user.update(user_params)
		render json: {user: @user, status: :ok}
	end

	private

	def user_params
		params.require(:user).permit(:first_name, :last_name, :email, :mobile, :gender, :password, :password_confirmation, :role)
	end

	def set_user
		@user = User.find(params[:id])
	end

end
