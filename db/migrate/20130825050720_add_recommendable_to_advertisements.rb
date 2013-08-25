class AddRecommendableToAdvertisements < ActiveRecord::Migration
  def change
    add_column :advertisements, :recommendable, :boolean
  end
end
