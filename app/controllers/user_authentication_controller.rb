class UserAuthenticationController < ApplicationController
  # return auth token once user is authenticated
  def authenticate
    auth_token= AuthenticateUser.new(user_params[:email], user_params[:password]).call
    json_response(auth_token: auth_token)
  end


  private

  def user_params
    params.permit(:email, :password)
  end
end
