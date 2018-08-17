class TagsController < ApplicationController
  before_action :set_tag

  def index
    @tags = Tag.all
    json_response(@tags)
  end

  def create
    @tag = Tag.create!(tag_params)
    json_response(@tag, :created)
  end

  def show
    json_response(@tag)
  end

  def update
    @tag.update(tag_params)
    head :no_content
  end

  def destroy
    @tag.destroy
    head :no_content
  end

  private

  def tag_params
    params.permit(:tag_name)
  end

  def set_tag
    @tag = Tag.find(params[:id])
  end
end
