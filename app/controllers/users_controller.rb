class UsersController < ApplicationController
	before_action :set_user, only: [:destroy, :update]
	skip_before_action :authenticate_request, only: [:create]
	before_action :set_user, only: [:show, :destroy, :update]
  skip_before_action :check_access

	def index
		users = User.all
		render json: {users: users, status: :ok}
	end

	def show
		if (params[:id].to_i) == (@current_user.id)
			render json: {user:@user, message:"You can see", status: :ok}
		else
			render json: {message:"Sorry You can not see", status: :unprocessable_entity}
		end
	end

	def create
		user = User.new(user_params)
		if user.save 
			render json: {user: user, message:"You are Registered", status: :ok}
		else
			render json: {message:"You can not Register", status: :unprocessble_entity}
		end
	end

	def destroy
		if @user.destroy 
  		render json: {message:"User has been Deleted", status: :ok}
	  else
      render json: {message:"User has been Deleted", status: :unprocessable_entity}
    end
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
