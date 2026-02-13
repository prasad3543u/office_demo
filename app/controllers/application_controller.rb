class ApplicationController < ActionController::API
  before_action :authorize_request

  def encode_token(payload)
    JWT.encode(payload, Rails.application.secret_key_base)
  end

  def decoded_token
    header = request.headers['Authorization']
    if header
      token = header.split(" ")[1]
      begin
        JWT.decode(token, Rails.application.secret_key_base, true, algorithm: 'HS256')
      rescue
        nil
      end
    end
  end

  def current_user
    if decoded_token
      user_id = decoded_token[0]['user_id']
      @current_user ||= User.find_by(id: user_id)
    end
  end

  def authorize_request
    render json: { message: "Please login" }, status: :unauthorized unless current_user
  end
end
