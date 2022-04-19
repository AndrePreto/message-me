class ChatroomController < ApplicationController
  before_action :require_user

  # GET / -> root_path
  def index
    @message = Message.new
    @messages = Message.order('created_at desc').limit(20)
  end
  
end