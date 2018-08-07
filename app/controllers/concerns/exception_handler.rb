module ExceptionHandler
  # provides the more graceful 'included' method
  extend ActiveSupport::Concern

  included do
    # Define custom handlers
    rescue_from ActiveRecord::RecordInvalid, with: :four_twenty_two
    rescue_from ExceptionHandler::AuthenticationError, with: :unauthorized_request
    rescue_from ExceptionHandler::MissingToken, with: :four_twenty_two
    rescue_from ExceptionHandler::InvalidToken, with: :four_twenty_two

    rescue_from ActiveRecord::RecordNotFound do |e|
      json_response({ message: e.message }, :not_found )
    end
  end

  private

   def four_twenty_two(e)
     json_response({ message: e.message}, :unauthorized)
   end

end
