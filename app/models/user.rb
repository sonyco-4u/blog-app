class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  has_many :comments, foreign_key: :author_id, dependent: :destroy
  has_many :likes, foreign_key: :author_id, dependent: :destroy
  has_many :posts, foreign_key: :author_id, dependent: :destroy
  validates_presence_of :name
  validates :posts_counter, numericality: { greater_than_or_equal_to: 0, only_integer: true }

  def is?(requested_role)
    role == requested_role.to_s
  end

  def latest_posts
    posts.order(created_at: :desc).limit(3)
  end
end
