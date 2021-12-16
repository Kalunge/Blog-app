class PostsController < ApplicationController
  load_and_authorize_resource
  def index
    @user = User.find_by(id: params['user_id'])
    @posts = @user.posts.includes(:comments).order(created_at: :desc)
  end

  def create
    @user = current_user
    @post = @user.posts.create(post_params)
    @post.CommentsCounter = 0
    @post.LikesCounter = 0

    respond_to do |format|
      format.html do
        if @post.save
          flash[:success] = 'Post created succeffuly'
          redirect_to user_posts_path(@user.id, @post.id)
        else
          flash[:error] = 'Post not created try again'
          render :new
        end
      end
    end
  end

  def show
    @post = Post.find_by(id: params['id'])
    @user = User.find_by(id: params['user_id'])
    @comments = @post.comments
    @likes = @post.likes
  end

  def destroy
    @user = current_user
    @post = @user.posts.find(params[:id])
    @post.comments.destroy_all
    @post.likes.destroy_all
    @post.destroy
    redirect_to user_path(@user.id), notice: 'Post deleted'
  end

  private

  def post_params
    params.require(:post).permit(:Title, :Text)
  end
end
