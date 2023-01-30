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

end
