class MessagesController < ApplicationController
  def index
    messages = Message.where(:channel => params[:channel])

    respond_to do |format|
      format.json { render :json => messages }
    end
  end

  def create
    @message = Message.new(params[:message])

    respond_to do |format|
      if @message.save
        Pusher[@message.channel].trigger('message', MessageDecorator.decorate(@message).to_hash)
        format.json { render :json => @message }
      else
        format.json { render :json => @message.errors, status: :unprocessable_entity }
      end
    end
  end
end
