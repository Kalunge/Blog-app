class CommentsController < ApplicationController
  def create
    @user = current_user
    @post = Post.find_by(id: params['post_id'])
    @comment = @post.comments.new(text: comment_params[:text], user: @user)

    respond_to do |format|
      format.html do
        if @comment.save
          flash[:success] = 'Comment created succeffuly'
          redirect_to user_post_path(@post.user.id, @post.id)
        else
          flash[:error] = 'Comment not created try again'
          redirect_to user_post_path(@post.user.id, @post.id)
        end
      end
    end
  end

  private

  def comment_params
    params.require(:@comment).permit(:text)
  end
end
