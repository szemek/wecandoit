class MessagesController < ApplicationController
  def index
    messages = Message.where(:channel => params[:channel])

    respond_to do |format|
      format.json { render :json => MessageDecorator.decorate_collection(messages) }
    end
  end

  def create
    default_username = '@'
    @message = Message.new(message_params)
    @message.username = (current_user && current_user.username) || default_username

    respond_to do |format|
      if @message.save
        format.json { render :json => MessageDecorator.decorate(@message) }
      else
        format.json { render :json => @message.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def message_params
    params.require(:message).permite(:channel, :content)
  end
end
