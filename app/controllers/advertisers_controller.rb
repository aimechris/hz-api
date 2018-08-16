class AdvertisersController < ApplicationController
  # POST /signup
  # return authenticated token upon signup
  def create
    advertiser = Advertiser.create!(advertiser_params)
    auth_token = AuthenticateAdvertiser.new(advertiser.email, advertiser.password).call
    response = { message: message.account_created, auth_token: auth_token }
    json_response(response, :created)
  end

  def dashboard
    # message = Message.find_by wher
    # statistics = List
    # listing = Listing.All
    # response = { messages: message, listings:listings, statistics:statistics }
    # json_response(response)
  end

  private

  def advertiser_params
    params.permit(
      :first_name,
      :last_name,
      :phone,
      :location,
      :email,
      :password,
      :password_confirmation
    )
  end
end
