class Like < ApplicationRecord
  belongs_to :post
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'

  after_save :update_likes_counter_for_post

  def update_likes_counter_for_post
    post.increment!(:likes_counter)
  end
end
