class AddMigratedToUsers < ActiveRecord::Migration
  def change
    add_column :users, :migrated, :boolean
  end
end
