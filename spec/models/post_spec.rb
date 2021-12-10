require 'rails_helper'

RSpec.describe Post, type: :model do
  it 'Pot title validations' do
    user = User.create(Name: 'John Doe', Bio: 'Software developer')
    post = Post.create(Title: 'Software development', Text: 'Software development is the act of writing code',
                       user: user)
    post.CommentsCounter = post.comments.count
    post.LikesCounter = post.likes.count
    expect(post).to be_valid
  end

  it 'Title must not be absent' do
    post = Post.new
    expect(post).to_not be_valid
  end

  it 'must be associated wit a user' do
    post = Post.new(user: nil)
    expect(post).to_not be_valid
  end

  it 'Title must not be too long' do
    user = User.create(Name: 'John Doe', Bio: 'Software developer')
    title = 'hello' * 100
    post = Post.create(Title: title, user: user)
    expect(post).to_not be_valid
  end
end
