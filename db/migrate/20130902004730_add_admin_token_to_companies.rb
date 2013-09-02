class AddAdminTokenToCompanies < ActiveRecord::Migration
  def change
    add_column :companies, :admin_token, :string
  end
end
