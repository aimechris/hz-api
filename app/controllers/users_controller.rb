class UsersController < ApplicationController
  # POST /signup
  # return authenticated token upon signup
  def dashboard
    @favorites = Favorite.find()
    @searches = Search.find()
    response = { favorites: @favorites, searches: @searches }
    json_response(response)
  end

  def create
    user = User.create!(user_params)
    auth_token = AuthenticateUser.new(user.email, user.password).call
    response = { message: Message.account_created, auth_token: auth_token }
    json_response(response, :created)
  end

  private
  
  def user_params
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
