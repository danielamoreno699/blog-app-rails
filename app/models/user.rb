class User < ApplicationRecord
    belongs_to :comment
    belongs_to :post
    belongs_to :like
end
