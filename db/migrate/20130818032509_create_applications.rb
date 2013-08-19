class CreateApplications < ActiveRecord::Migration
  def change
    create_table :applications do |t|
      t.string :name
      t.string :email
      t.integer :university
      t.string :degree

      t.timestamps
    end
  end
end
