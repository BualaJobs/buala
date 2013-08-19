class FixApplicationsUniversityColumn < ActiveRecord::Migration
  
  def change
  	rename_column :applications, :university, :university_id
  end

end
