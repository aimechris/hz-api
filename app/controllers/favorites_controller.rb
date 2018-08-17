class FavoritesController < ApplicationController
  before_action :set_favorite

  def index
    @favorites = Favorite.all
  end

  def create
    @favorite = Favorite.create!(favorite_params)
    json_response(@favorite, :created)
  end

  def show
    json_response(@favorite)
  end

  def update
    @favorite.update(favorite_params)
  end

  def destroy
    @favorite.destroy
    head :no_content
  end

  private

  def favorite_params
    params.permit(:user_id, :listing_id, :created_by)
  end

  def set_favorite
    @favorite = Favorite.find(params[:id])
  end
end
