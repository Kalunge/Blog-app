class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post

  def self.update_likes_counter(post_id)
    Post.find_by(id: post_id).update(LikesCounter: Like.where(post_id: post_id).count)
  end
end
