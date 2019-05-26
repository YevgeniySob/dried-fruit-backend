class MessagesController < ApplicationController

  def create
    message = Message.new(content: params[:content], user_id: params[:user_id], chatroom_id: params[:chatroom_id])
    new_message = {}
    new_message[:content] = message.content
    new_message[:user_id] = message.user_id
    new_message[:chatroom_id] = message.chatroom_id
    new_message[:username] = message.user.username
    new_message[:user_image] = message.user.image
    if message.save
      new_message[:created_at] = message.created_at
      # byebug
      ActionCable.server.broadcast("chatroom_channel", new_message)
      render json: new_message
    else
      puts "blah"
    end
  end

  private

  # Uneeded for now
  def message_params
    # params.require(:message).permit(content: params[:content], user_id: params[:user_id], chatroom_id: params[:chatroom_id])
  end
end
