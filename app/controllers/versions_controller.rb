class VersionsController < ApplicationController
  def index
    doc = Document.find(params[:document_id])
    render json: doc.versions, status: 200
  end

  def create
    @version = Version.create!(version_params)
    render json: @version, status: 200
  end

  def destroy
    Version.destroy(params[:id])
  end

  def show
    @version = Version.find(params[:id])
    render json: @version, status: 200
  end

  private

  def version_params
    params.permit(:data, :document_id)
  end
end
