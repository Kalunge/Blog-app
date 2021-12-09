require 'rails_helper'

RSpec.describe Post, type: :model do
  it 'Title must be present' do
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
