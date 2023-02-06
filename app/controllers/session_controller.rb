class SessionController < ApplicationController
  # To Skip Filter on Create action to make user login
  skip_before_action :authenticate_request
  skip_before_action :check_user  
  

  def create
    user = User.find_by(email: params[:email])
    if user&.authenticate(params[:password])
      token = jwt_encode(user_id: user.id)
      render json: { token: token , status: :ok }
    else
      render json: { error: 'Email and password is incorrect', status: :unauthorized }
    end
  end

end
