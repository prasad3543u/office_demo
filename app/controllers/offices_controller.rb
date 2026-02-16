class OfficesController < ApplicationController
 
  # ✅ GET /offices
  def index
    offices = Office.all
    render json: offices
  end

  # ✅ GET /offices/:id
  def show
    office = Office.find(params[:id])
    render json: office
  end

  # ✅ POST /offices
  def create
    office = Office.new(office_params)
    if office.save
      render json: office, status: :created
    else
      render json: office.errors, status: :unprocessable_entity
    end
  end

  # ✅ PUT/PATCH /offices/:id
  def update
    office = Office.find(params[:id])
    if office.update(office_params)
      render json: office
    else
      render json: office.errors, status: :unprocessable_entity
    end
  end

  # ✅ DELETE /offices/:id
  def destroy
    office = Office.find(params[:id])
    office.destroy
    render json: { message: "Office deleted successfully" }
  end

  private

  def office_params
    params.permit(:name, :location)
  end
end
