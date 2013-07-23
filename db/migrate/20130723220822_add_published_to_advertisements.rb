class AddPublishedToAdvertisements < ActiveRecord::Migration
  def change
    add_column :advertisements, :published, :boolean
  end
end
