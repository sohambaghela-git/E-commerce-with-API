class ApplicationController < ActionController::API
	include JsonWebToken 
	before_action :authenticate_request

	private
	def authenticate_request
		header = request.headers["token"]
		header = header.split(" ").last if header
		decoded = jwt_decode(header)
		@current_user = User.find(decoded[:user_id])
	end

	def current_user
		@current_user.present?
	end

  def seller
    if @current_user.role == 'seller'
			return {message: "Yeah! you are authorize"}
    else
      return { message: "Oops! you are not authorize", status: :unprocessable_entity}
    end
  end

	def authorize_user
		if @current_user.id == @product.user_id
			return {message: "Yeah! you are authorize"}
		else
			return {message: "Oops! you are not authorize", status: :unprocessable_entity}
		end
	end

end
