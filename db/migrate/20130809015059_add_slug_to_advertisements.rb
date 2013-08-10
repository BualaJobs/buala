class AddSlugToAdvertisements < ActiveRecord::Migration
  def change
    add_column :advertisements, :slug, :string, unique: true
  end
end
