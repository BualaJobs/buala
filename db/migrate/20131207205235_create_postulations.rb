class CreatePostulations < ActiveRecord::Migration
  def change
    create_table :postulations do |t|
      t.integer :user_id
      t.integer :advertisement_id

      t.timestamps
    end
  end
end
