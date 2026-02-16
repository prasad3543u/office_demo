class ApplicationController < ActionController::API
  before_action :authorize_request

  private

  def authorize_request
    header = request.headers['Authorization']
    
    if header
      token = header.split(' ').last
      begin
        decoded = JWT.decode(token, Rails.application.secret_key_base)[0]
        @current_user = Employee.find(decoded["employee_id"])
      rescue
        render json: { error: "Unauthorized" }, status: :unauthorized
      end
    else
      render json: { error: "Token missing" }, status: :unauthorized
    end
  end
end
