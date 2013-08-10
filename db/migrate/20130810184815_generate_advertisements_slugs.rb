class GenerateAdvertisementsSlugs < ActiveRecord::Migration
  def up
  	Advertisement.find_each(&:save)
  end

  def down
  end
end
