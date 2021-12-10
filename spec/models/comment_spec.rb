require 'rails_helper'

RSpec.describe Comment, type: :model do
  it 'Text should be present' do
    comment = Comment.new(text: nil)
    expect(comment).to_not be_valid
  end

  it 'is associated with a post' do
    post = Post.create(Title: 'Anew post', Text: 'Welcome to my blog')
    comment = Comment.create(text: 'hello', post: post)
    expect(comment.post).to eq(post)
  end

  it 'is invalid without a post' do
    expect(Comment.new(post: nil)).to be_invalid
  end

  it 'is associated with a user' do
    user = User.create(Name: 'John Doe', Bio: 'Software developer')
    comment = Comment.create(text: 'hello', user: user)
    expect(comment.user).to eq(user)
  end

  it 'is invalid without a user' do
    expect(Comment.new(user: nil)).to be_invalid
  end
end
