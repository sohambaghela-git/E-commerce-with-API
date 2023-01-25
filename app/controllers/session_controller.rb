class SessionController < ApplicationController
  skip_before_action :authenticate_request

  def create
    @user = User.find_by(email: params[:email])
    # debugger
    if @user&.authenticate(params[:password])
      token = jwt_encode(user_id: @user.id)
      render json: { token: token }, status: :ok
    else
      render json: { error: " email and password is incorrect "}, status: :unauthorized
    end
  end

  def destroy
    session[:user_id] = nil
    render json: {message: " you are logged out "}, status: :ok
  end

  private

end
