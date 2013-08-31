class AddResumeUrlToApplications < ActiveRecord::Migration
  def change
    add_column :applications, :resume_url, :string
  end
end
