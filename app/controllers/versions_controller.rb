class VersionsController < ApplicationController
  def index
    @versions = Version.all
  end

  def approve
    @version = Version.find(params[:id])
    @company = @version.company
    @company.update_version(@version)
    @version.destroy
    redirect_to versions_path
  end
end
