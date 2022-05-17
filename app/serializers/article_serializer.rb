class ArticleSerializer < ActiveModel::Serializer
  type :data

  attribute :id
  attribute :created_at
  attribute :updated_at

  attribute :title
  attribute :description
  attribute :views

  has_many :comments, each_serializer: CommentSerializer
end
