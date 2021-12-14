class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  validates :Name, presence: { message: 'You must fill in your name' }

  has_many :posts
  has_many :likes
  has_many :comments

  def self.three_recent_posts(user_id)
    Post.where(user_id: user_id).last(3)
  end
end
