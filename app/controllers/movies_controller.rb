class MoviesController < ApplicationController
  before_action :signed_in_user, only: [:index,:edit,:update, :destroy]
  before_action :correct_user, only: [:edit,:update]
  before_action :admin_user,     only: :destroy
  def index
    @movies = Movie.all
  end
  
  def show
    @movie = Movie.find(params[:id])
  end
  
  def new
    
  end
  # Private section, makes the page unable to be seen for non logged in users
  private
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
  
  def correct_user
    @user = User.find(params[:id])
    redirect_to root_url unless current_user?(@user)
  end
end