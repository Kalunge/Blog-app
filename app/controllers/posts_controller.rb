class PostsController < ApplicationController
  def index
    @user = User.find_by(id: params['user_id'])
    @posts = @user.posts
  end

  def create
    @user = self.current_user
    @post = @user.posts.create(post_params)

    respond_to do | format |
      format.html do
        if @post.save
          # flash[:success] = "Post created successfully"
          redirect_to user_posts_path(@post.user.id, @post.id), notice: "Post created succeffuly"
        else
          flash[:error] = "Post not created try again"
          render new
        end
      end
    end
  end

  
  def show
    @post = Post.find_by(id: params['id'])
    @comments = @post.comments
    @likes = @post.likes
  end

  private
  
  def post_params
    params.require(:post).permit(:Title, :Text)
  end
end
