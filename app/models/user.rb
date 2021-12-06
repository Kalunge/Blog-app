class User < ApplicationRecord
  has_many :posts
  has_many :likes
  has_many :comments

  def self.three_recent_posts(author_id)
    Post.where(author_id: author_id).last(3)
  end
end
