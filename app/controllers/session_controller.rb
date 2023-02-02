class SessionController < ApplicationController
  skip_before_action :authenticate_request
  skip_before_action :check_access

  def create
    @user = User.find_by(email: params[:email])
    if @user&.authenticate(params[:password])
      token = jwt_encode(user_id: @user.id)
      render json: { token: token }, status: :ok
    else
      render json: { message: "Email and password is incorrect", status: :unauthorized}
    end
  end

  def destroy
    session[:user_id] = nil
    render json: {message: "You are logged out", status: :ok}
  end

end
