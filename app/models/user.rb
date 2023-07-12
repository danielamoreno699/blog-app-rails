class User < ApplicationRecord
    belongs_to :comment, foreign_key: :author_id
    belongs_to :post, foreign_key: :author_id
    belongs_to :like, foreign_key: :author_id
end
