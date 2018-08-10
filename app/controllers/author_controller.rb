class AuthorController < ApplicationController
  # POST /signup
  # return authenticated token upon signup
  def create
    author = Author.create!(author_params)
    auth_token = AuthenticateAuthor.new(author.email, author.password).call
    response = { message: Message.account_created, auth_token: auth_token }
    json_response(response, :created)
  end

  def advertiser_params
    params.permit(
      :first_name,
      :last_name,
      :email,
      :password,
      :password_confirmation
    )
  end
end
