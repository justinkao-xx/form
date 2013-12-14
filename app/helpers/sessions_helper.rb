module SessionsHelper
  def sign_in(user)
                cookies.permanent[:remember_token] = user.remember_token
                self.current_user = user
                flash[:success] = "Sign in successful"
  end
  def signed_in?
                !current_user.nil?
  end
end