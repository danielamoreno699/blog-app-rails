class CommentSerializer < ActiveModel::Serializer
  attributes :id, :Text, :author_id, :post_id
end
