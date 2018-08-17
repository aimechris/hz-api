class CategoriesController < ApplicationController
  before_action :set_category

  def index
    @categories = Category.all
  end

  def create
    @category = Category.create!(category_params)
  end
  def show
    json_response(@category)
  end
  def update
    @category.update(category_params)
    head :no_content
  end
  def destroy
    @category.destroy
    head :no_content
  end

  private

  def category_params
    params.permit(:category_name)
  end

  def set_category
    @category = Category.find(params[:id])
  end
end
