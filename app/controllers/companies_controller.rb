class CompaniesController < ApplicationController
  layout 'landing'
  def edit
    @company = Company.find(params[:id])
    if current_user.company != @company
      redirect_to root_path
    end
  end

  def update
    #everytime company attributes get updated
    @company = Company.find(params[:id])
    if @company.version == nil
      @version = Version.new(company_params)
      @version.company_id = @company.id
      if @version.save 
        sign_out
        redirect_to thank_you_path
      else
        redirect_to edit_company_path(@company)
      end
    else
      @company.version.update(company_params)
      sign_out
      redirect_to thank_you_path
    end
  end

  def show
    @company = Company.find(params[:id])
    # unless @company.version
    #   @company == nil
    # end
  end

  def thankyou
  end

  private
  def company_params
    params.require(:company).permit(:title, :url, :logo, :description, :industry, :location, :engineers, :core_stack, :stage)
  end
end
