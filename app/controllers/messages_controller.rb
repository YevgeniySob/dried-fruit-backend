class MessagesController < ApplicationController

  def create
    message = Message.new(content: params[:content], user_id: params[:user_id], chatroom_id: params[:chatroom_id], likes: 0)
    new_message = {}
    new_message[:content] = message.content
    new_message[:user_id] = message.user_id
    new_message[:chatroom_id] = message.chatroom_id
    new_message[:username] = message.user.username
    new_message[:user_image] = message.user.image
    new_message[:likes] = 0
    if message.save
    new_message[:id] = message.id
      new_message[:created_at] = message.created_at
      # byebug
      ActionCable.server.broadcast("chatroom_channel", new_message)
      render json: new_message
    else
      puts "blah"
    end
  end

  def update
    # byebug
    @message = Message.find_by(id: params[:id])
    @message.update(likes: @message.likes += 1)
    render json: @message

      # render json: {error: "couldn't find message"}
    # end

  end

  private

  # Uneeded for now
  def message_params
    # params.require(:message).permit(content: params[:content], user_id: params[:user_id], chatroom_id: params[:chatroom_id])
  end
end
