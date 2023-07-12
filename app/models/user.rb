class User < ApplicationRecord
    has_many :comments
    has_many :posts
    has_many :likes

    def recent_posts
    end
end
