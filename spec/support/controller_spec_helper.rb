module ControllerSpecHelper
  ############### Advertiser #####################
  def advertiser_token_generator(advertiser_id)
    JsonWebToken.encode(advertiser_id: advertiser_id)
  end

  def expired_advertiser_token_generator(advertiser_id)
    JsonWebToken.encode({ advertiser_id: advertiser_id}, (Time.now.to_i - 10))
  end
  ###############################################
  ############## Author Generators ##############
  def author_token_generator(author_id)
    JsonWebToken.encode(author_id: author_id)
  end

  def expired_author_generator(author_id)
    JsonWebToken.encode({ author_id: author_id}, (Time.now.to_i - 10))
  end
  ################################################
  ################### User Generators ############
  def user_token_generator(user_id)
    JsonWebToken.encode(user_id: user_id)
  end
  def expired_user_token_generator(user_id)
    JsonWebToken.encode({ user_id: user_id}, (Time.now.to_i - 10))
  end
  ################################################


  
  def valid_headers
    {
      "Authorization" => advertiser_token_generator(advertiser.id),
      "Content-Type" => "application/json"
    }
  end

  def invalid_headers
    {
      "Authorization" => nil,
      "Content-Type" => "application/json"
    }
  end
end
