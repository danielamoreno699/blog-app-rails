class Like < ApplicationRecord

  validates :author_id, presence: true
  validates :post_id, presence: true

  belongs_to :user, foreign_key: 'author_id'
  belongs_to :post, foreign_key: 'post_id'

  after_create :increment_likes_counter
  after_destroy :decrement_likes_counter

  def increment_likes_counter
    puts 'Incrementing likes counter'
    post.increment!(:LikesCounter)
  end

  def decrement_likes_counter
    puts 'Decrementing likes counter'
    post.decrement!(:LikesCounter)
  end
end
