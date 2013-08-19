class AddAdvertisementToApplications < ActiveRecord::Migration
  def change
    add_column :applications, :advertisement_id, :integer
  end
end
