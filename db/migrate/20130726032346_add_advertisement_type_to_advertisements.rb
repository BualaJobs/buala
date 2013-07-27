class AddAdvertisementTypeToAdvertisements < ActiveRecord::Migration
  def change
    add_column :advertisements, :advertisement_type_id, :integer
  end
end
