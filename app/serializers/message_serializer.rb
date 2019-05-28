class MessageSerializer < ActiveModel::Serializer
  attributes :id, :content, :user_id, :created_at, :updated_at, :username, :user_image, :likes
  belongs_to :user



end
