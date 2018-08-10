class AuthenticateUser
  def initialize(email, password)
    @email = email
    @password = password
  end

  # Service entry point

  def call
    JsonWebToken.encode(user: user.id) if user
  end

  private

  attr_reader :email, :password

  # verify user invalid_credentials
  def user
    user = user.find_by(email: email)
    return user if user && user.authenticate(password)
    # raise Authentication error if credetials are invalid_token
    raise(ExceptionHandler::AuthenticationError, Message.invalid_credentials)
  end
end
