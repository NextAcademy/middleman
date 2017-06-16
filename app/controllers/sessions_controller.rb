class SessionsController < Clearance::SessionsController
  layout 'landing'

  def destroy
    sign_out
    redirect_to root_path
  end

   def create
    @user = authenticate(params)

    sign_in(@user) do |status|
      if status.success?
        if @user.superadmin?
          redirect_to versions_path
        else
          redirect_back_or url_after_create
        end
      else
        flash.now.notice = status.failure_message
        render template: "sessions/new", status: :unauthorized
      end
    end
  end

end
