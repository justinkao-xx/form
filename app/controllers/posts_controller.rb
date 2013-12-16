class PostsController < ApplicationController
  def index
    
  end
  
  def show
    
  end
  
  def create
     @post = current_user.Post.new(post_params)
    if @post.save
      flash[:success] = "post created!"
      redirect_to root_url
    else
      render 'static_pages/home'
    end
  end
  
  def destroy
    
  end
  private
  def posts_params
    params.require(:posts).permit(:content)
  end
end