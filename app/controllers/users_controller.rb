class UsersController < ApplicationController
  
  def new
      @user = User.new
  end
  
  def create
    @user = User.new(user_params)
      if @user.save
        sign_in @user
        flash[:success]= "Registration success!"
        redirect_to user_path(current_user)
      else
        render 'new'
     end 
  end
  
  def show
    #if signed_in?
      @user = User.find(params[:id])
    #end
  end
private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
  
end