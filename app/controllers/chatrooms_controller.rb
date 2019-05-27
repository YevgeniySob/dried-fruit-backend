class ChatroomsController < ApplicationController
  # before_action :get_chatroom, only: [:show]
  # skip_before_action :authorized, only: [:index]
  def index
    @chatrooms = Chatroom.all
    render json: @chatrooms
  end

  def show
    @chatroom = Chatroom.find(params[:id])
    render json: @chatroom
  end

  def create
    @chatroom = Chatroom.new(name: params[:name])
    if @chatoom.save
      # Maybe have chatrooms instantly created with ActionCable broadcast
      render json: @chatroom
    end
  end

  private

  def get_chatroom
    @chatroom = Chatroom.find(params[:id])
  end

end
