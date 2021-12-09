require 'rails_helper'

RSpec.describe Like, type: :model do

  it 'is associated with a post' do
    post = Post.create(Title: 'Anew post', Text: 'Welcome to my blog')
    like = Like.create(post: post)
    expect(like.post).to eq(post)
  end

  it 'is invalid without a post' do
    expect(Like.new(post: nil)).to be_invalid
  end

  it 'is associated with a user' do
    user = User.create(Name: 'John Doe', Bio: 'Software developer')
    like = Like.create(user: user)
    expect(like.user).to eq(user)
  end

  it 'is invalid without a user' do
    expect(Like.new(user: nil)).to be_invalid
  end
end
