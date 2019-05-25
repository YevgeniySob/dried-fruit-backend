class MessageSerializer < ActiveModel::Serializer
  attributes :id, :content, :user_id, :created_at, :updated_at, :username, :user_image
  belongs_to :user



end
