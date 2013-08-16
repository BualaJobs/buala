class GeocodeCompanies < ActiveRecord::Migration
  def up
    Company.all.each do |company|
      company.save!
    end
  end

  def down
  end
end
