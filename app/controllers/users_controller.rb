class UsersController < ApplicationController
  def new
  end

  def create
  end

  def show
    @user = User.find(params[:id])
    render json: @user, status: :accepted
  end

  def index
    @users = User.select(:id, :username)
    render json: @users.to_json, status: :accepted
  end
end
