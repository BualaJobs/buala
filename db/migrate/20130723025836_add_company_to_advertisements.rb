class AddCompanyToAdvertisements < ActiveRecord::Migration
  def change
    add_column :advertisements, :company_id, :integer
  end
end
