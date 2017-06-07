class CompaniesController < ApplicationController
  def edit
    @company = Company.find(params[:id])
  end

  def update
    #everytime company attributes get updated
    @company = Company.find(params[:id])
    byebug
    if @company.version == nil
      @version = Version.new(company_params)
      @version.company_id = @company.id
      if @version.save 
        redirect_to thank_you_path
      else
        redirect_to edit_company_path(@company)
      end
    else
      @company.version.update(company_params)
      redirect_to thank_you_path
    end

    #saves the first time the company attributes get updated and subsequent gets approved 
    # if @company.created_at == @company.updated_at 
    #   @company.update(company_params)
    # else
    #   @version = Version.new(company_params)
    #   if @version.save
    #   
    #   end
    # end
    
  end

  def thankyou
  end

  private
  def company_params
    params.require(:company).permit(:title, :url, :logo, :description, :industry, :location, :engineers, :core_stack, :stage)
  end
end
