class CompaniesController < ApplicationController
  def edit
    @company = Company.find(params[:id])
  end

  def update
    @company = Company.find(params[:id])
    @company.update(company_params)
    byebug
  end

  private
  def company_params
    params.require(:company).permit(:title, :url, :logo, :description, :industry, :location, :engineers, :core_stack, :stage)
  end
end
