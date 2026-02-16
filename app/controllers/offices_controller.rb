class OfficesController < ApplicationController
  protect_from_forgery with: :null_session

  def index
    offices = Office.all
    render json: offices
  end

  def create
    office = Office.create(office_params)
    render json: office
  end

  def update
    office = Office.find(params[:id])
    office.update(office_params)
    render json: office
  end

  private

  def office_params
    params.require(:office).permit(:name, :location)
  end
end
