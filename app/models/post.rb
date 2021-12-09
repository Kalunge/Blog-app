class Post < ApplicationRecord
  validates :Title, presence: { message: 'You must enetr the title' },
                    length: { maximum: 250, too_long: 'Title must not exceed 250 characters' }
  validates_numericality_of :CommentsCounter, only_integer: true, greater_than_or_equal: 0
  validates_numericality_of :LikesCounter, only_integer: true, greater_than_or_equal: 0

  belongs_to :user
  has_many :comments
  has_many :likes

  def self.update_post_counter(user_id)
    Post.find_by(id: user_id).update(posts_counter: Post.where(user_id: user_id).count)
  end

  def self.five_recent_posts(post_id)
    Comment.find_by(post_id: post_id).last(5)
  end
end
