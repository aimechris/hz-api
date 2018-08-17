class AdvertiserAuthenticationController < ApplicationController
  # return auth token once advertiser is authenticated
  def authenticate
    auth_token= AuthenticateAdvertiser.new(advertiser_params[:email], advertiser_params[:password]).call
    json_response(auth_token: auth_token)
  end


  private

  def advertiser_params
    params.permit(:email, :password)
  end
end
