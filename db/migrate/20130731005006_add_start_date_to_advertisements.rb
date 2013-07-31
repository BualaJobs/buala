class AddStartDateToAdvertisements < ActiveRecord::Migration
  def change
    add_column :advertisements, :start_date, :date
  end
end
