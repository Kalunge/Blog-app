class LikesController < ApplicationController
  def create
    @user = current_user
    @post = Post.find_by(id: params['post_id'])
    @like = @post.likes.new(user: @user)

    respond_to do |format|
      format.html do
        if @like.save
          flash[:success] = 'Post liked successfully'
        else
          flash[:error] = 'post not liked successfully'
        end
        redirect_to user_post_path(@post.user.id, @post.id)
      end
    end
  end

  def destroy
    previous_url = request.env['HTTP_REFERER']
    like_to_delete = Like.find_by(user_id: params[:id])

    if like_to_delete.destroy
      flash[:notice] = 'Post unliked successfully!'
    else
      flash[:alert] = 'Unable to unlike this post'
    end
    redirect_to(previous_url)
  end
end
