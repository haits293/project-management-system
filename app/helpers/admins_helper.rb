module AdminsHelper
  def admin_params
    params.require(:admin).permit(:name, :email, :password,
      :password_confirmation)
  end

  def logged_in_admin
    unless logged_in?
      flash[:danger] = "Please log in."
      redirect_to login_url
    end
  end
end
