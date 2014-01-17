class ShowsController < ApplicationController
  before_action :signed_in_user, only: [:index,:edit,:update, :destroy]
  before_action :correct_user, only: [:edit,:update]
  before_action :admin_user,     only: :destroy
  def index
    @shows = Show.all
  end
  
  def show
    @show = Show.find(params[:id])
  end
  
  def new
    @show = Show.new
  end
  
  def create
    @show = Show.create(show_params)
    if @show.save
      flash[:success] = "Show posted!"
      redirect_to shows_path
    else
      render new_show_path
    end
  end
  
  def update
    
    if @show.update_attributes(show_params)
      flash[:success] = "Update successful"
      redirect_to @show
    else
      render 'edit'
    end
  end
  
  def destroy
    Shows.find(params[:id]).destroy
    flash[:success] = "Show deleted from the database."
    redirect_to shows_path
  end
  # Private section, makes the page unable to be seen for non logged in users
  private
  def show_params
    params.require(:show).permit(:name, :description, :year, :seasons)
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
  
  def correct_user
    @user = User.find(params[:id])
    redirect_to root_url unless current_user?(@user)
  end
end