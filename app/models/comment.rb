class Comment < ApplicationRecord
    has_many :user
    has_many :post
end