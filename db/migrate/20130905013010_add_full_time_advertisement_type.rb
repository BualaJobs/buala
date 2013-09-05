class AddFullTimeAdvertisementType < ActiveRecord::Migration
  def up
  	AdvertisementType.create name: 'Full Time'
  	puts "Full Time advertisement type created"
  end

  def down
  	AdvertisementType.where(name: 'Full Time').destroy_all
  	puts "Full Time advertisement type removed"
  end
end
