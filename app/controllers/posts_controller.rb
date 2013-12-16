class PostsController < ApplicationController
  def index
    @post = current_user.posts.build
  end
  
  def show
    
  end
  
  def create
     @post = current_user.posts.build(post_params)
    if @post.save
      flash[:success] = "Post created!"
      redirect_to root_url
    else
      render 'posts/index'
    end
  end
  
  def destroy
    
  end
 
  private
 
  def post_params
    params.require(:post).permit(:content)
  end
end