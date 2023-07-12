class Post < ApplicationRecord
    belongs_to :comment, foreign_key: :post_id
    belongs_to :like, foreign_key: :post_id
    has_many :users
end