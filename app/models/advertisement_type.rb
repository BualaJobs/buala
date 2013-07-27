class AdvertisementType < ActiveRecord::Base
  attr_accessible :name

  validates_uniqueness_of :name
  validates :name, presence: true
end
