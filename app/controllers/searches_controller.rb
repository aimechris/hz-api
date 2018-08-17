class SearchesController < ApplicationController
  before_action :set_search

  def index
    @searches = Search.all
    json_response(@searches)
  end

  def create
    @search = Search.create!(search_params)
    json_response(@search, :created)
  end

  def update
    @search.update(search_params)
    head :no_content
  end

  def destroy
    @search.destroy
  end

  private

  def search_params
    params.permit(:url_search, :user_id, :created_by)
  end

  def set_search
    @search = Search.find(params[:id])
  end
end
