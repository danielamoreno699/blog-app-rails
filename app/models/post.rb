class Post < ApplicationRecord
  belongs_to :user, foreign_key: 'author_id'
  has_many :likes
  has_many :comments

  after_create :increment_post_counter
  after_destroy :decrement_post_counter

  def increment_post_counter
    puts 'Incrementing post counter'
    user.increment!(:post_counter)
  end

  def decrement_post_counter
    puts 'Decrementing post counter'
    user.decrement!(:post_counter)
  end

  def recent_comments(limit)
    comments.order(created_at: :desc).limit(limit)
  end
end
