class AddPublicationDateToAdvertisements < ActiveRecord::Migration
  def change
    add_column :advertisements, :publication_date, :datetime
  end
end
