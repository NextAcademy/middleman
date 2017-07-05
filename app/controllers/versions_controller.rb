class VersionsController < ApplicationController
  layout 'landing'
  def index
    if current_user.superadmin?
      @versions = Version.all
    else
      redirect_to thank_you_path
    end
  end

  def approve
    @version = Version.find(params[:id])
    @company = @version.company
    @company.update_version(@version)
    @version.destroy
    redirect_to versions_path
  end
end
