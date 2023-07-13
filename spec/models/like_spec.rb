require 'rails_helper'

RSpec.describe Like, type: :model do
  describe '#increment_likes_counter' do
    it 'increments the LikesCounter of the associated post' do
      user = User.create(name: 'John Doe', post_counter: 0)
      post = Post.create(author_id: user.id, Title: 'Second Post', Text: 'More thoughts', CommentsCounter: 0, LikesCounter: 0)

      like = Like.create(author_id: user.id, post_id: post.id)
      expect { like.increment_likes_counter }.to change { post.reload.LikesCounter }.by(1)
    end
  end

  describe '#decrement_likes_counter' do
    it 'decrement the LikesCounter of the associated post' do
      user = User.create(name: 'John Doe', post_counter: 2)
      post = Post.create(author_id: user.id, Title: 'Second Post', Text: 'More thoughts', CommentsCounter: 6, LikesCounter: 4)

      like = Like.create(author_id: user.id, post_id: post.id)
      expect { like.decrement_likes_counter }.to change { post.reload.LikesCounter }.by(-1)
    end
  end
end
