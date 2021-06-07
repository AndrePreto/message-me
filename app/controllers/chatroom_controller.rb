class ChatroomController < ApplicationController
  
  def index
    @messages = Message.all.order('id asc')
  end
  
end