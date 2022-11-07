class User::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: %i[show update destroy]

  def index
    # render json: { message: 'You Done!' }, status: 200
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to(@user, notice: 'User Created')
    else
      render action: 'new'
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      flash[:success] = 'Object was successfully updated'
      redirect_to @user
    else
      flash[:error] = 'Something went wrong'
      render 'edit'
    end
  end

  private

  def user_params
    params.require(:user).permit(:user_name, :email, :password)
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end
end
