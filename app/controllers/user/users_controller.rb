class Shift::UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    render json: { message: 'You Done!' }, status: 200
  end

  def create
    @user = User.new(user_params)
    if @user.save
      UserNotifierMailer.send_signup_email(@user).deliver
      redirect_to(@user, notice: 'User Created')
    else
      render action: 'new'
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
