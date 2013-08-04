class AddZohoFormUrlToAdvertisements < ActiveRecord::Migration
  def change
    add_column :advertisements, :zoho_form_url, :text
  end
end
