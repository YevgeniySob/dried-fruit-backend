class Chatroom < ApplicationRecord
  has_many :messages
  has_many :users, through: :messages

  def usersInChat
    self.users.uniq
  end
end


