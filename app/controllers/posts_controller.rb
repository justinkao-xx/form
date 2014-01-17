class PostsController < ApplicationController

  def index
    @post = current_user.posts.build
  end

  def show

  end

  def new
    @post = current_user.posts.build
  end

  def create
     @post = current_user.posts.build(post_params)
    if @post.save
      flash[:success] = "Post created!"
      redirect_to current_user
    else
<<<<<<< HEAD
      render current_user
=======
      render :new
>>>>>>> 3e832ac2bc58a9aca92e50176671bb35000eb3df
    end
  end

  def destroy
     @post = Post.find params[:id]

     if @post.destroy
      redirect_to root_path, notice: "Post deleted."
     else
      redirect_to root_path, alert: "Couldn't delete Post: #{@post.errors.full_messages}"
  end

  end

  private

  def post_params
    params.require(:post).permit(:content)
  end

end
