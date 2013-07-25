class Company < ActiveRecord::Base
  attr_accessible :description, :location, :name, :website

  validates :name, :description, :presence => true
  
end
