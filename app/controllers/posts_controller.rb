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
    @post.destroy
    redirect_to users_url
  end
 
  private
 
  def post_params
    params.require(:post).permit(:content)
  end
  
  def correct_user
    @post = current_user.posts.find_by(id: params[:id])
      redirect_to root_url if @post.nil?
  end
end