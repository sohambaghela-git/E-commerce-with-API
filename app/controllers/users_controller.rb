class UsersController < ApplicationController
	before_action :set_user, only: [:show, :destroy, :update]
	skip_before_action :authenticate_request, only: [:create]

	def index
		@users = User.all
		debugger
		render json: @users
	end

	def show
		render json: @user
	end

	def create
		@user = User.new(user_params)
		if @user.save 
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
