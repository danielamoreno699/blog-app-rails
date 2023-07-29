class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable


  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable, :trackable

  validates :name, presence: true
  validates :post_counter, comparison: { greater_than_or_equal_to: 0 }

  has_many :comments, foreign_key: 'author_id', dependent: :destroy
  has_many :posts, foreign_key: 'author_id', dependent: :destroy
  has_many :likes, foreign_key: 'author_id'

  #before_save :generate_api_token
  after_initialize :set_default_role, if: :new_record?

  def recent_posts
    posts.order(created_at: :desc).limit(3)
  end

  def set_default_role
    self.role ||= 'user' # Replace 'user' with the default role you want to set
  end

  before_save :generate_api_token

  private

  def generate_api_token
    self.api_token = SecureRandom.hex(16)
    puts "Generated API Token: #{self.api_token}" # Debug output
  end


  # def generate_api_token
  #   self.api_token = SecureRandom.hex(16)
  # end
end
