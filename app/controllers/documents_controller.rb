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

  def revert
    @document = Document.find(params[:document_id])
    version_ids = @document.revert_version(params[:version_id])
    render json: version_ids, status: 200
  end

  private

  def document_params
    params.permit(:title, :user_id, :current_version, versions: [:id, :data])
  end

  def get_user
    @user = User.find(params[:user_id])
  end
end
