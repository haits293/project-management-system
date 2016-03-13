class UsersController < ApplicationController
  def index
    @users = User.paginate(page: params[:page], per_page: 5)
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      @user.status = "active"
      redirect_to @user
      flash[:success] = "Added Successfully"
    else
      render "new"
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    if User.find_by(id: params[:user_id]).nil?
      @user = User.find(params[:id])
      if @user.update_attributes(user_params)
        redirect_to @user
        flash[:success] = "Profile updated"
      else
        render "edit"
      end
    else
      @user = User.find(params[:user_id])
      if @user.update_attribute(:role, params[:role])
        redirect_to users_url
        flash[:success] = "Saved"
      else
        render "edit"
      end
    end
  end

  def destroy
    User.find(params[:id]).update_attribute(:status, "deleted")
    redirect_to users_url
    flash[:success] = "user deleted"
  end
end
