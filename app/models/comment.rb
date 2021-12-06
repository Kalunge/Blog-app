class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  def self.update_comment_counter(post_id)
    Post.find_by(id: post_id).update(comments_counter: Comment.where(post_id: post_id).count)
  end
end
