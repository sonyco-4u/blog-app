class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :comments
  has_many :likes

  validates :title, presence: true
  validates :title, length: { maximum: 250 }
  validates :comments_counter, comparison: { greater_than_or_equal_to: 0 }
  validates :likes_counter, comparison: { greater_than_or_equal_to: 0 }

  after_save :update_post_counter

  def most_recent_comments
    comments.order('created_at Desc').limit(5)
  end

  private

  def update_post_counter
    author.increment!(:posts_counter)
  end
end
