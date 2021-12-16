require 'rails_helper'

RSpec.describe User, type: :model do
  before(:each) do
    @user = User.new(Name: 'John Doe', Bio: 'Test Bio', email: "Doe@gmail.com", password: "qwerty", photo: 'http://www.pselaw.com/wp-content/uploads/2016/08/pokemon-150x150.jpg')
  end

  it 'is not valid if name absent' do
    @user.Name = nil
    expect(@user).to_not be_valid
  end

  it 'User name presence validation' do
    @user.PostsCounter = @user.posts.count
    expect(@user).to be_valid
  end

  it 'is not valid if photo absent' do
    expect(@user).to be_valid
  end

  it 'is not valid without bIO' do
    expect(@user).to be_valid
  end
end
