class Company < ActiveRecord::Base
  attr_accessible :description, :location, :name, :website
end