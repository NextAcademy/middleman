class UsersController < Clearance::UsersController

  def create
    @user = User.new(user_params)
    @company = Company.new(title: params[:user][:company][:title], url: params[:user][:company][:url])
    if @user.save 
      @company.user_id = @user.id
      if @company.save
        sign_in @user 
        UserNotifierMailer.send_signup_email(@user).deliver
        redirect_to edit_company_path(@user.company)
        return
      end
      @user.destroy
    end
    redirect_to welcome_path
  end

  def welcome
    if signed_in?
      redirect_to edit_company_path(current_user.company)
    else
      @user = User.new
      render "users/new", layout: 'landing'
    end
  end

  private
  def user_params
    params.require(:user).permit(:full_name, :email, :password)
  end

end
