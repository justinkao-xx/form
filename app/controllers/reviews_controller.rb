class ReviewsController < ApplicationController
  before_action :signed_in_user, only: [:index,:edit,:update, :destroy]
  before_action :admin_user,     only: :destroy
  before_action :set_review, only: [:show, :edit, :update, :destroy]
  def index
    @reviews = Review.all
  end
  
  def show
    @review = Review.find(params[:id])
  end
  
  def new
    @review = current_user.reviews.build
  end
  
  def create
    @review = current_user.reviews.build(review_params)
    if @review.save
      flash[:success] = "Review created!"
      redirect_to reviews_path
    else
      flash[:success] = "Did you leave a field empty? All fields must be filled before we can accept the review!"
      render new_review_path
    end
  end
  
  def update
    if @review.update_attributes(review_params)
      flash[:success] = "Update successful"
      redirect_to @review
    else
      render 'edit'
    end
  end
  
  def edit
    
  end
  
  def destroy
    Review.find(params[:id]).destroy
    flash[:success] = "Review deleted from the database."
    redirect_to reviews_path
  end
 
  # Private section, makes the page unable to be seen for non logged in users
  private
  def review_params
    params.require(:review).permit(:heading, :content, :user_id, :about)
  end
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
   def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
  # Redirecting not logged in user etc.
  def signed_in_user
    unless signed_in?
      store_location
      redirect_to '/sessions/new', notice: "Please sign in!"
    end
    
  end
  
  def set_review
    @review = Review.find(params[:id])
  end
  
end