class ListingsController < ApplicationController
  before_action :set_listing, only:[:show, :update, :destroy]
  # Root Content
  def index
    @listings = Listings.all
  end
  #
  def show
    json_response(@listing)
  end
  # Create Listing
  def create
    @listing = Listing.create!(listing_params)
    json_response(@listing, :created)
  end
  # Update Listing
  def update
    @listing.update(listing_params)
    head :no_content
  end
  # Destroy Listing
  def destroy
    @listing.destroy
    head :no_content
  end

  private

  def listing_params
    params.permit(:address, :zip_code, :city,
                  :state, :bed, :bath, :sqft,
                  :property_type, :built_year,
                  :sale_type, :price, :title,
                  :description, :virtual_tour, :display_img,
                  :listimages_attributes(
                    :image
                  )
                )
  end

  def set_listing
    @listing = Listing.find(params[:id])
  end
end
