class UsersController < ApplicationController
  def new
  end

  def create
  end

  def show
    @user = User.find(params[:id])
    render json: @user, status: 200
  end

  def index
    render json: User.all, status: 200
  end
end
