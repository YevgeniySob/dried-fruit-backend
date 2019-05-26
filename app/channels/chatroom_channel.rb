class ChatroomChannel < ApplicationCable::Channel
  def subscribed
    # chatroom = Chatroom.find_by(id: 1)
    # stream_for chatroom
    stream_from "chatroom_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
    # raise "huh?"
  end
end
