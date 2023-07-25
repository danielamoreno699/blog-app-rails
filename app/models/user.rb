class User < ApplicationRecord

  #has_secure_password

  validates :name, presence: true
  validates :post_counter, comparison: { greater_than_or_equal_to: 0 }

  has_many :comments, foreign_key: 'author_id'
  has_many :posts, foreign_key: 'author_id'
  has_many :likes, foreign_key: 'author_id'

  def recent_posts
    posts.order(created_at: :desc).limit(3)
  end
end
