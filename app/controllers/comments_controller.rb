class CommentsController < ApplicationController
  def create
    @user = current_user
    @post = Post.find_by(id: params['post_id'])
    @comment = @post.comments.new(text: comment_params[:text], user: @user)

    respond_to do |format|
      format.html do
        if @comment.save
          flash[:success] = 'Comment created succeffuly'
        else
          flash[:error] = 'Comment not created try again'
        end
        redirect_to user_post_path(@post.user.id, @post.id)
      end
    end
  end

  def destroy
    previous_url = request.env['HTTP_REFERER']
    comment_to_delete = Comment.find(params[:id])

    if comment_to_delete.destroy
      flash[:notice] = 'Comment Deleted successfully!'
    else
      flash[:alert] = 'Unable to delete comment Try again later'
    end
    redirect_to(previous_url)
  end

  private

  def comment_params
    params.require(:@comment).permit(:text)
  end
end
