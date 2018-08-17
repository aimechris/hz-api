class MessagesController < ApplicationController
  before_action :set_message

  def create
    @message = Message.create!(message_params)
    json_response(@message, :created)
  end
  def show
    json_response(@message)
  end
  def update
    @message.update!(message_params)
    head :no_content
  end

  def destroy
    @message.destroy
  end

  private

  def message_params
    params.permit(:mssg_txt, :listing_id, :created_at)
  end

  def set_message
    @message = Message.find(params[:id])
  end
end
