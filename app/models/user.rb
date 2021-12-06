class User < ApplicationRecord
  has_many :posts
  has_many :likes
  has_many :comments

  def self.three_recent_posts(id)
    Post.where(author_id: id).order(created_at: :desc).limit(3)
  end
end
