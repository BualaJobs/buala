class AddExpirationDateToAdvertisements < ActiveRecord::Migration
  def change
    add_column :advertisements, :expiration_date, :datetime
  end
end
