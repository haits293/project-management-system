module UsersHelper
  def user_params
    params.require(:user).permit(:name, :email, :password,
      :password_confirmation, :role)
  end

  def logged_in_user
    unless logged_in?
      flash[:danger] = "Please log in."
      redirect_to login_url
    end
  end
end
