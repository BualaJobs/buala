class AddCategory1ToAdvertisements < ActiveRecord::Migration
  def change
    add_column :advertisements, :category_1_id, :integer
  end
end
