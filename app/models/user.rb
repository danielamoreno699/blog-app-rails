class User < ApplicationRecord
    has_many :comments
    has_many :posts
    has_many :likes

    def recent_posts(limit)
        posts.order(created_at: :desc).limit(limit)
      end
      
end
