class AddShortDescriptionToAdvertisements < ActiveRecord::Migration
  def change
    add_column :advertisements, :short_description, :text
  end
end
