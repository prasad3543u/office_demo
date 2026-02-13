class TagsController < ApplicationController

  def index
    render json: Tag.all
  end

  def create
    tag = Tag.create(tag_params)
    render json: tag
  end

  def show
    tag = Tag.find(params[:id])
    render json: tag
  end

  def update
    tag = Tag.find(params[:id])
    tag.update(tag_params)
    render json: tag
  end

  def destroy
    tag = Tag.find(params[:id])
    tag.destroy
    render json: { message: "Tag deleted" }
  end

  private

  def tag_params
    params.permit(:name)
  end
end
