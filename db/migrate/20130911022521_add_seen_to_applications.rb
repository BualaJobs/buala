class AddSeenToApplications < ActiveRecord::Migration
  def change
    add_column :applications, :seen, :boolean
  end
end
