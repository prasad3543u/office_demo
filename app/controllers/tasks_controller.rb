class TasksController < ApplicationController

  # GET /projects/:project_id/tasks
  def index
    project = current_user.projects.find(params[:project_id])
    render json: project.tasks
  end

  # GET /projects/:project_id/tasks/:id
  def show
    project = current_user.projects.find(params[:project_id])
    task = project.tasks.find(params[:id])
    render json: task
  end

  # POST /projects/:project_id/tasks
  def create
  project = current_user.projects.find(params[:project_id])
  task = project.tasks.create(task_params)

  if params[:tag_ids]
    tags = Tag.where(id: params[:tag_ids])
    task.tags << tags
  end

  render json: task, include: :tags
end

  # PUT / PATCH
  def update
  project = current_user.projects.find(params[:project_id])
  task = project.tasks.find(params[:id])

  if task.update(task_params)
    if params[:tag_ids]
      task.tags = Tag.where(id: params[:tag_ids])
    end
    render json: task, include: :tags
  else
    render json: { errors: task.errors.full_messages }, status: :unprocessable_entity
  end
end

  # DELETE
  def destroy
    project = current_user.projects.find(params[:project_id])
    task = project.tasks.find(params[:id])
    task.destroy
    render json: { message: "Task deleted successfully" }
  end

  private

  def task_params
    params.permit(:title, :status)
  end
end
