class AdminsController < ApplicationController
  before_action :logged_in_admin, only: [:edit, :update]
  before_action :is_super_admin, only: [:index, :destroy, :new, :create]

  def index
    @admins = Admin.paginate(page: params[:page], per_page: "#{Settings.per_page}")
  end

  def show
    @admin = Admin.find(params[:id])
  end

  def new
    @admin = Admin.new
  end

  def create
    @admin = Admin.new(admin_params)
    if @admin.save
      @admin.status = "active"
      redirect_to @admin
      flash[:success] = "Added Successfully"
    else
      render "new"
    end
  end

  def edit
    @admin = Admin.find(params[:id])
  end

  def update
    if Admin.find_by(id: params[:admin_id]).nil?
      @admin = Admin.find(params[:id])
      if @admin.update_attributes(admin_params)
        redirect_to @admin
        flash[:success] = "Profile updated"
      else
        render "edit"
      end
    else
      @admin = Admin.find(params[:admin_id])
      if @admin.update_attribute(:role, params[:role])
        redirect_to admins_url
        flash[:success] = "Saved"
      else
        render "edit"
      end
    end
  end

  def destroy
    Admin.find(params[:id]).update_attribute(:status, "deleted")
    redirect_to admins_url
    flash[:success] = "Admin deleted"
  end
end
