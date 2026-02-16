class OfficeEmployeesController < ApplicationController
 

  def index
    render json: OfficeEmployee.all
  end

  def show
    mapping = OfficeEmployee.find(params[:id])
    render json: mapping
  end

  def create
    mapping = OfficeEmployee.create(office_employee_params)
    render json: mapping
  end

  def destroy
    mapping = OfficeEmployee.find(params[:id])
    mapping.destroy
    render json: { message: "Relation removed" }
  end

  private

  def office_employee_params
    params.require(:office_employee).permit(:office_id, :employee_id)
  end
end
