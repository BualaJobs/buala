class AddCompanyLogoToCompanies < ActiveRecord::Migration
  def change
    add_column :companies, :company_logo, :string
  end
end
