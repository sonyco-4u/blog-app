class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'

  after_save :update_comment_counter_for_post

  def update_comment_counter_for_post
    posts.increment!(:comments_counter)
  end
end
