class UsersController < Clearance::UsersController
  def new 
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @company = Company.new(title: params[:user][:company][:title], url: params[:user][:company][:url])
    if @user.save  ## what happens if user save but company doesnt save???
      @company.user_id = @user.id
      if @company.save
        sign_in @user 
        redirect_to edit_company_path(@user.company)
        return
      end
      @user.destroy
    end
    redirect_to sign_up_path
  end

  private
  def user_params
    params.require(:user).permit(:full_name, :email, :password)
  end

  # def company_params
  #   params.require(:company).permit(:title, :url)
  # end
end
