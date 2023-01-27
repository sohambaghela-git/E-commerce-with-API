class UsersController < ApplicationController
	before_action :set_user, only: [:destroy, :update]
	skip_before_action :authenticate_request, only: [:create]
	# before_action :current_user, only: [:index, :destroy, :update]

	def index
		@users = User.all
		@current_user = $current_user
		render json: {users: @users, current_user: @current_user }
	end

	def show
		@user = User.find(params[:id])
		# debugger
		if (params[:id].to_i).eql?($current_user.id)
			render json: @user
		else
			render json: " Sorry You can not "
		end
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
