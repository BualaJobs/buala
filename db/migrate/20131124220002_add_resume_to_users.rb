class AddResumeToUsers < ActiveRecord::Migration
  def up
  	add_attachment :users, :resume
  end

  def down
  	remove_attachment :user, :resume
  end
end
