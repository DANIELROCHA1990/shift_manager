class Shift::UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    render json: { message: 'You Done!' }, status: 200
  end
end
