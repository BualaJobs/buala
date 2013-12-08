class AddSeenToPostulations < ActiveRecord::Migration
  def change
    add_column :postulations, :seen, :boolean
  end
end
