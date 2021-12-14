class MessagesController < ApplicationController
  before_action :require_user

  # POST /messages
  def create
    @message = current_user.messages.new(message_params)
    mod_message = message_render(@message)
    ActionCable.server.broadcast('chatroom_channel', mod_message: mod_message) if @message.save 
  end

  private

  def message_params
    params.require(:message).permit(:body)
  end

  def message_render(message)
    render(partial: 'message', locals: { message: message })
  end
  
end