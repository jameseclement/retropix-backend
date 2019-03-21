class UsersController < ApplicationController
  def new
  end

  def create
  end

  def show
  end

  def index
    render json: User.all, status: 200
  end
end
