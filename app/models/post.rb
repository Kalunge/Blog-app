class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :likes

  def self.update_post_counter(user_id)
    Post.find_by(id: user_id).update(posts_counter: Post.where(user_id: user_id).count)
  end

  def self.five_recent_posts(post_id)
    Comment.find_by(post_id: post_id).order(created_at: :desc).limit(5)
  end
end
