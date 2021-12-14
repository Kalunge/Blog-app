class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = current_user
    @posts = @user.posts.order(created_at: :desc)
  end
end
