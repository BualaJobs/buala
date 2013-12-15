class AddMigrationTokenToUsers < ActiveRecord::Migration
  def change
    add_column :users, :migration_token, :string
  end
end
