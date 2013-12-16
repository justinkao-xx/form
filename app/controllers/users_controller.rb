class UsersController < ApplicationController
  before_action :signed_in_user, only: [:index,:edit,:update, :destroy]
  before_action :correct_user, only: [:edit,:update]
  before_action :admin_user,     only: :destroy
  
  def index
    @users = User.all
  end
  
  def show
    @user = User.find(params[:id])
    @posts = @user.posts.all
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      sign_in @user
      flash[:success] = "Registration was successful!"
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit
    
  end
  
  def update
    
    if @user.update_attributes(user_params)
      flash[:success] = "Update successful"
      sign_in @user
      redirect_to @user
    else
      render 'edit'
    end
  end
  
  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User Deleted."
    redirect_to users_url
  end
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