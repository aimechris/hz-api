class AuthenticateAuthor
  def initialize(email, password)
    @email = email
    @password = password
  end

  # Service entry point

  def call
    JsonWebToken.encode(author: author.id) if author
  end

  private

  attr_reader :email, :password

  # verify author invalid_credentials
  def author
    author = author.find_by(email: email)
    return author if author && author.authenticate(password)
    # raise Authentication error if credetials are invalid_token
    raise(ExceptionHandler::AuthenticationError, Message.invalid_credentials)
  end
end
