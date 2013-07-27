class AddDegreeToUsers < ActiveRecord::Migration
  def change
    add_column :users, :degree_id, :integer
  end
end
