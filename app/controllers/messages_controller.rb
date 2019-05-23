class MessagesController < ApplicationController

  def create
    @message = Message.new(content: params[:content], user_id: params[:user_id], chatroom_id: params[:chatroom_id])

    if @message.save
      ActionCable.server.broadcast("chatroom", @message)
      render json: @message
    else
      puts "blah"
    end
  end


  private

  # Uneeded for now
  def message_params
    # params.require(:message).permit()
  end
end
