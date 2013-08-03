class AddRequirementsToAdvertisements < ActiveRecord::Migration
  def change
    add_column :advertisements, :requirements, :text
  end
end
