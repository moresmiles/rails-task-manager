class CommentSerializer < ActiveModel::Serializer
  attributes :id, :content, :user_id, :list_id
  belongs_to :user
  belongs_to :list
end
