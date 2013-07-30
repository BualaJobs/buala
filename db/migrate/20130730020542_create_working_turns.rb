class CreateWorkingTurns < ActiveRecord::Migration
  def change
    create_table :working_turns do |t|
      t.string :name

      t.timestamps
    end
  end
end
