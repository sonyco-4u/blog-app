class User < ApplicationRecord
  has_many :posts, foreign_key: :author_id
  has_many :likes, foreign_key: :author_id
  has_many :comments, foreign_key: :author_id

  validates :name, presence: true
  validates :posts_counter, comparison: { greater_than_or_equal_to: 0 }

  def most_recent_posts
    posts.order('created_at Desc').limit(3)
  end
end
