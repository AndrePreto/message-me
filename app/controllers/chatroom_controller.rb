class ChatroomController < ApplicationController
  before_action :require_user

  # GET / -> root_path
  def index
    @message = Message.new
    @messages = Message.all.order('id asc')
  end
  
end