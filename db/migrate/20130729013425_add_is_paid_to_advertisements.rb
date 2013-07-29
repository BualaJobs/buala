class AddIsPaidToAdvertisements < ActiveRecord::Migration
  def change
    add_column :advertisements, :is_paid, :boolean
  end
end
