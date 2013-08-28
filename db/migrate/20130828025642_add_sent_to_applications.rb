class AddSentToApplications < ActiveRecord::Migration
  def change
    add_column :applications, :sent, :boolean
  end
end
