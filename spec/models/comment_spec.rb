require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe '#increment_comments_counter' do
    it 'increments the LikesCounter of the associated post' do
      user = User.create(name: 'John Doe', post_counter: 0)
      post = Post.create(author_id: user.id, Title: 'Second Post', Text: 'More thoughts', CommentsCounter: 0,
                         LikesCounter: 0)

      comment = Comment.create(author_id: user.id, post_id: post.id, Text: 'im happy im sharing my comments!')
      expect { comment.increment_comments_counter }.to change { post.reload.CommentsCounter }.by(1)
    end
  end

  describe '#decrement_comments_counter' do
    it 'decrements the LikesCounter of the associated post' do
      user = User.create(name: 'John Doe', post_counter: 0)
      post = Post.create(author_id: user.id, Title: 'Second Post', Text: 'More thoughts', CommentsCounter: 2,
                         LikesCounter: 2)

      comment = Comment.create(author_id: user.id, post_id: post.id, Text: 'im happy im sharing my comments!')
      expect { comment.decrement_comments_counter }.to change { post.reload.CommentsCounter }.by(-1)
    end
  end
end
