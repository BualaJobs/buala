class AddAttachmentResumeToApplications < ActiveRecord::Migration
  def self.up
    change_table :applications do |t|
      t.attachment :resume
    end
  end

  def self.down
    drop_attached_file :applications, :resume
  end
end
