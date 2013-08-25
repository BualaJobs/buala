class SetAllAdvertisementsAsRecommendable < ActiveRecord::Migration
  def up
    Advertisement.all.each do |advertisement|
      if advertisement.published
        advertisement.recommendable = true
        advertisement.save
      end
    end
  end

  def down
  end
end
