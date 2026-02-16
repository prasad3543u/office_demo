class AuthController < ApplicationController
  skip_before_action :authorize_request
  include JsonWebToken

  def login
    employee = Employee.find_by(email: params[:email])

    if employee&.authenticate(params[:password])
      token = encode(employee_id: employee.id)
      render json: { token: token }
    else
      render json: { error: "Invalid email or password" }, status: :unauthorized
    end
  end
end
