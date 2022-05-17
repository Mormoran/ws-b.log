class CommentSerializer < ActiveModel::Serializer
  type :data

  attribute :id
  attribute :created_at
  attribute :updated_at

  attribute :content
end
