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
      render posts_new_path
    end
  end
  
  def destroy
     @post = Post.find params[:id]
     
     if @post.destroy
      redirect_to posts_new_path, notice: "Post deleted."
     else
      redirect_to posts_new_path, alert: "Couldn't delete Post: #{@post.errors.full_messages}"
  end
    
  end
 
  private
 
  def post_params
    params.require(:post).permit(:content)
  end
  
end