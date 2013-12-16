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
    Post.find(params[:id]).destroy
    flash[:success] = "Post Deleted."
    redirect_to users_url
  end
 
  private
 
  def post_params
    params.require(:post).permit(:content)
  end
end