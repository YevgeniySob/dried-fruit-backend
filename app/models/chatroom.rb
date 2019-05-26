class Chatroom < ApplicationRecord
  has_many :messages, dependent: :destroy
  has_many :users, through: :messages

  # topic does not exist yet, so I commented this out -jagens
  # validates :topic, presence: true, uniqueness: true, case_sensitive: false

  def usersInChat
    self.users.uniq
  end
end
