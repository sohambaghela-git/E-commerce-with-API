class ApplicationController < ActionController::API
	include JsonWebToken
	before_action :authenticate_request
  before_action :check_access

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

  def check_access
    default_role = YAML.load(File.read(Rails.root.to_s + '/config/role.yml'))
    authorize = default_role[@current_user.role][params[:controller]]
    unless authorize.include?(params[:action])
      render json: {message: "You are not authorize", status: :unprocessable_entity}
    end
    
  end

end
