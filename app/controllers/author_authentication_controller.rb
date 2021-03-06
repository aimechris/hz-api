class AuthorAuthenticationController < ApplicationController
  # return auth token once advertiser is authenticated
  def authenticate
    auth_token= AuthenticateAuthor.new(auth_params[:email], auth_params[:password]).call
    json_response(auth_token: auth_token)
  end


  private

  def auth_params
    params.permit(:email, :password)
  end
end
