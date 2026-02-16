class EmployeesController < ApplicationController
  skip_before_action :authorize_request, only: [:create]

  # GET /employees
  def index
    render json: Employee.all
  end

  # POST /employees
  def create
    employee = Employee.new(employee_params)

    if employee.save
      render json: employee, status: :created
    else
      render json: employee.errors, status: :unprocessable_entity
    end
  end

  # GET /employees/:id
  def show
    employee = Employee.find(params[:id])
    render json: employee, include: :offices
  end

  # PUT /employees/:id
  def update
    employee = Employee.find(params[:id])

    if employee.update(employee_params)
      render json: employee
    else
      render json: employee.errors, status: :unprocessable_entity
    end
  end

  # DELETE /employees/:id
  def destroy
    employee = Employee.find(params[:id])
    employee.destroy
    render json: { message: "Employee deleted" }
  end

  private

  def employee_params
    params.require(:employee).permit(:name, :email, :password, :password_confirmation, :position)
  end
end
