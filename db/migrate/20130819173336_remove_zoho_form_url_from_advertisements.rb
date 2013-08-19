class RemoveZohoFormUrlFromAdvertisements < ActiveRecord::Migration
  def up
    remove_column :advertisements, :zoho_form_url
  end

  def down
    add_column :advertisements, :zoho_form_url, :string
  end
end
