class User < ApplicationRecord
  has_many :messages
  has_many :chatrooms, through: :messages
  has_secure_password
end
