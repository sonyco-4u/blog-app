class Post < ApplicationRecord
  has_many :comments
  has_many :likes
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'

  validates :title, presence: true, length: { maximum: 250 }
  validates :comments_counter, numericality: { greater_than_or_equal_to: 0, only_integer: true }
  validates :likes_counter, numericality: { greater_than_or_equal_to: 0, only_integer: true }

  after_save :update_posts_counter_for_user

  def update_posts_counter_for_user
    author.increment!(:posts_counter)
  end

  def five_most_recent_comment
    comments.order(created_at: :desc).limit(5)
  end
end
