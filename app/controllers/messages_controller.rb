class MessagesController < ApplicationController
  before_action :set_message

  def create
    message = Message.create!(message_params)
  end
    
end
