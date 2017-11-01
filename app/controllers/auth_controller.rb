class AuthController < ApplicationController
  skip_before_action :authorized, only: [:create]

  def create
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      token = encode_token({ user_id: @user.id})
      render json: { username: @user.username, jwt: token }, status: 202
    else
      render json: { message: "Invalid username or password"}, status: 401
    end

  end

  private

  def user_login_params
    params.require(:user).permit(:username, :password)
  end

end
