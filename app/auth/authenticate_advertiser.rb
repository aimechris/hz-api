class AuthenticateAdvertiser
  def initialize(email, password)
    @email = email
    @password = password
  end

  # Service entry point

  def call
    JsonWebToken.encode(advertiser: advertiser.id) if advertiser
  end

  private

  attr_reader :email, :password

  # verify advertiser invalid_credentials
  def advertiser
    advertiser = Advertiser.find_by(email: email)
    return advertiser if advertiser && advertiser.authenticate(password)
    # raise Authentication error if credetials are invalid_token
    raise(ExceptionHandler::AuthenticationError, Message.invalid_credentials)
  end
end
