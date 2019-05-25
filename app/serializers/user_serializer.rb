class UserSerializer < ActiveModel::Serializer
  attributes :id, :image, :username
  has_many :messages
end
