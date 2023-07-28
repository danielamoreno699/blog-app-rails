class PostSerializer < ActiveModel::Serializer
  attributes :id, :Title, :Text, :author_id, :CommentsCounter, :LikesCounter
end
