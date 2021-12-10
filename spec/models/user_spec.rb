require 'rails_helper'

RSpec.describe User, type: :model do
  before(:each) do
    @user = User.new(Name: 'John Doe', Bio: 'Test Bio')
  end

  it 'is not valid if name absent' do
    @user.Name = nil
    expect(@user).to_not be_valid
  end

   it 'User name presence validation' do
    @user.PostsCounter= @user.posts.count
    expect(@user).to be_valid
  end

  it 'is not valid if photo absent' do
    @user.photo = nil
    expect(@user).to_not be_valid
  end

  it 'is not valid without bIO' do
    @user.Bio = nil
    expect(@user).to_not be_valid
  end
end
