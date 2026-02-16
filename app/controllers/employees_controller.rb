class EmployeesController < ApplicationController
  protect_from_forgery with: :null_session

  # GET /employees
  def index
    render json: Employee.all
  end

  # POST /employees
  def create
    employee = Employee.create(employee_params)
    render json: employee
  end

  # GET /employees/:id
  def show
    employee = Employee.find(params[:id])
    render json: employee, include: :offices
  end

  # PUT /employees/:id
  def update
    employee = Employee.find(params[:id])
    employee.update(employee_params)
    render json: employee
  end

  # DELETE /employees/:id
  def destroy
    employee = Employee.find(params[:id])
    employee.destroy
    render json: { message: "Employee deleted" }
  end

  private

  def employee_params
    params.require(:employee).permit(:name, :position)
  end
end
