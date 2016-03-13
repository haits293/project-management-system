class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:user_session][:email].downcase)
    if user
      if user.authenticate(params[:user_session][:password])
        if !(user.status == "deleted")
          log_in user
          remember user
          redirect_to user
        else
          flash[:danger] = "Your account is banned. Please contact support@decior.com to reactive your account. Thank you!"
          render "new"
        end
      else
        flash[:danger] = "Invalid email/password combination"
        render "new"
      end
    else
      flash[:danger] = "Please fill in your email and password"
      render "new"
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_path
  end
end
