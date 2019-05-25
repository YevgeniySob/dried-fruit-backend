class Message < ApplicationRecord
  belongs_to :user
  belongs_to :chatroom

  def username
    self.user.username
  end

  def user_image
    self.user.image
  end
end
