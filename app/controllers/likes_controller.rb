class LikesController < ApplicationController
  def create
    @user = current_user
    @post = Post.find_by(id: params['post_id'])
    @like = @post.likes.new(user: @user)

    respond_to do |format|
      format.html do
        if @like.save
          flash[:success] = 'Post created successfully'
        else
          flash[:error] = 'post not liked'
        end
        redirect_to user_post_path(@post.user.id, @post.id)
      end
    end
  end
end
