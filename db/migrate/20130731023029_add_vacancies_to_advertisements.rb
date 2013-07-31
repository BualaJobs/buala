class AddVacanciesToAdvertisements < ActiveRecord::Migration
  def change
    add_column :advertisements, :vacancies, :integer
  end
end
