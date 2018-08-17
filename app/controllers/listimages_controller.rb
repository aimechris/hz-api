class ListimagesController < ApplicationController
  before_action :set_listimage

  def index
    @listimages = Listimage.all
    json_response(@listimages)
  end

  def create
    @listimage = Listimage.create!(listimage_params)
    json_response(@listimage, :created)
  end
  def update
    @listimage.update(listimage_params)
    head :no_content
  end

  def destroy
    @listimage.destroy
    head :no_content
  end

  private

  def listimage_params
    params.permit(:image, :listing_id)
  end

  def set_listimage
    @listimage = Listimage.find(params[:id])
  end

end
