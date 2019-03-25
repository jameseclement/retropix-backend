class VersionsController < ApplicationController
  def create
    @version = Version.create!(version_params)
  end

  def destroy
    Version.destroy(params[:id])
  end

  def show
    @version = Version.find(params[:id])
    render json: @version
  end

  private

  def version_params
    params.permit(:data, :document_id)
  end
end
