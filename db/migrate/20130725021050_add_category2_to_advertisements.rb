class AddCategory2ToAdvertisements < ActiveRecord::Migration
  def change
    add_column :advertisements, :category_2_id, :integer
  end
end
