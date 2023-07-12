class Post < ApplicationRecord
    belongs_to :user, foreign_key: :author_id
    has_many :likes
    has_many :comments
end