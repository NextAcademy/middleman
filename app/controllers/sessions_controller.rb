class SessionsController < Clearance::SessionsController
  layout 'landing'

  def destroy
    sign_out
    redirect_to root_path
  end

end
