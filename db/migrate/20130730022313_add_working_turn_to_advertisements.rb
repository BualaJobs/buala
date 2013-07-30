class AddWorkingTurnToAdvertisements < ActiveRecord::Migration
  def change
    add_column :advertisements, :working_turn_id, :integer
  end
end
