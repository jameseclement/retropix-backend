class DocumentsController < ApplicationController
before_action :get_user, except: [:create, :destroy]

  def create
    @document = Document.create(document_params)
  end

  def update
    @document = Document.find(params[:id])
    @document.update(document_params)
    if @document.save
      render json: @document, status: :accepted
    else
      render json: { errors: @document.errors.full_messages }, status: :unprocessible_entity
    end
  end

  def destroy
    Document.destroy(params[:id])
  end

  def index
    render json: @user.documents
  end

  def show
    @document = Document.find(params[:id])
    render json: @document
  end

  private

  def document_params
    params.require(:document).permit(:title, :user_id)
  end

  def get_user
    @user = User.find(params[:user_id])
  end



end
