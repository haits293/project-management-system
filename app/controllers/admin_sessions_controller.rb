class AdminSessionsController < ApplicationController
  def new
  end

  def create
    admin = Admin.find_by(email: params[:admin_session][:email].downcase)
    if admin
      if admin.authenticate(params[:admin_session][:password])
        if !(admin.status == "deleted")
          log_in admin
          remember admin
          redirect_to admin
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
