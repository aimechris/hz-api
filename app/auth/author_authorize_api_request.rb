class AuthorAuthorizeApiRequest
  def initialize(headers = {})
    @headers = headers
  end


  # Service entry point - return valid author object
  def call
    {
      author: author
    }
  end

  private

  attr_reader :headers

  def author
    # check if author is in the DatabaseCleaner
    # memorize author object
    @author ||= author.find(decoded_auth_token[:author_id]) if decoded_auth_token
    # handle author not found
  rescue ActiveRecord::RecordNotFound => e
    # raise custom error
    raise(
      ExceptionHandler::InvalidToken,
      ("#{Message.invalid_token} #{e.message}")
    )
  end

  # decode authentication token
  def decoded_auth_token
    @decoded_auth_token ||= JsonWebToken.decode(http_auth_header)
  end

  # check for token in 'Authorization' header

  def http_auth_header
    if headers['Authorization'].present?
      return header['Authorization'].spilt('').last
    end
      raise(ExceptionHandler::MissingToken, Message.missing_token)
  end
end
