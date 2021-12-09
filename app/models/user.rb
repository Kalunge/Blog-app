class User < ApplicationRecord
  validates :Name, presence: { message: 'You must fill in your name' }
  validates_numericality_of :PostsCounter, only_integer: true, greater_than_or_equal: 0

  has_many :posts
  has_many :likes
  has_many :comments

  def self.three_recent_posts(author_id)
    Post.where(author_id: author_id).last(3)
  end
end
