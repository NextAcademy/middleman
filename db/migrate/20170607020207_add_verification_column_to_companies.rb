class AddVerificationColumnToCompanies < ActiveRecord::Migration[5.1]
  def change
    add_column :companies, :verficiation, :boolean, default: false
  end
end
