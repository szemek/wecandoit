class ChatController < ApplicationController
  def index
  end

  def channel
    @messages = Message.where(:channel => params[:channel])
  end
end
