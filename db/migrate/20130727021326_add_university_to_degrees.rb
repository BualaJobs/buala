class AddUniversityToDegrees < ActiveRecord::Migration
  def change
    add_column :degrees, :university_id, :integer
  end
end
