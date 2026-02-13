class AuthController < ApplicationController
  skip_before_action :authorize_request, only: [:register, :login]

  def register
    user = User.create(user_params)
    token = encode_token({ user_id: user.id })
    render json: { user: user, token: token }
  end

  def login
    user = User.find_by(email: params[:email])
    if user&.authenticate(params[:password])
      token = encode_token({ user_id: user.id })
      render json: { token: token }
    else
      render json: { message: "Invalid credentials" }, status: :unauthorized
    end
  end

  private

  def user_params
    params.permit(:name, :email, :password)
  end
end
