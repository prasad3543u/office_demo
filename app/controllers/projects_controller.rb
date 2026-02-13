class ProjectsController < ApplicationController

  def index
    render json: current_user.projects
  end

  def create
    project = current_user.projects.create(project_params)
    render json: project
  end

  def show
    project = current_user.projects.find(params[:id])
    render json: project
  end

def destroy
  project = current_user.projects.find(params[:id])
  project.destroy
  render json: { message: "Project deleted successfully" }
end
  private

  def project_params
    params.permit(:title, :description)
  end
end

