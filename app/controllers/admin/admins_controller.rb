class Admin::AdminsController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_admin, only: %i[show update destroy]

  def dashboard
    @shifts = Shift.order(id: :asc)
    @users = User.order(id: :asc)
  end

  def create
    @admin = Admin.new(admin_params)
    if @admin.save
      redirect_to(@admin, notice: 'Admin Created')
    else
      render action: 'new'
    end
  end

  def update
    if @admin.update_attributes(params[:admin])
      flash[:success] = 'Object was successfully updated'
      redirect_to @admin
    else
      flash[:error] = 'Something went wrong'
      render 'edit'
    end
  end

  private

  def set_admin
    @admin = Admin.find(params[:id])
  end

  def admin_params
    params.require(:admin).permit(:admin_name, :email, :password)
  end

  # def authenticate_admin
  #   redirect_to new_admin_session_path unless current_admin
  # end
end
