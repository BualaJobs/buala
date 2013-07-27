class CreateAdvertisementTypes < ActiveRecord::Migration
  def change
    create_table :advertisement_types do |t|
      t.string :name

      t.timestamps
    end
  end
end
