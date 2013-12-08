class CreateFullPostulations < ActiveRecord::Migration
  def change
    create_table :full_postulations do |t|

      t.timestamps
    end
  end
end
