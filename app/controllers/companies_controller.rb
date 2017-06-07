class CompaniesController < ApplicationController
  def edit
    @company = Company.find(params[:id])
  end

  def update
    @company = Company.find(params[:id])
    if @company.created_at == @company.updated_at 
      @company.update(company_params)
    else
      byebug
      # @company_version = current_user.company.create(company_params)
    end
    redirect_to thank_you_path
  end

  def thankyou
  end

  private
  def company_params
    params.require(:company).permit(:title, :url, :logo, :description, :industry, :location, :engineers, :core_stack, :stage)
  end
end
