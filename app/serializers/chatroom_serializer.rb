class ChatroomSerializer < ActiveModel::Serializer
  attributes :id, :name, :usersInChat
  has_many :messages
  # has_many :users
end
