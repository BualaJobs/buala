class Company < ActiveRecord::Base
  attr_accessible :description, :location, :name, :website, :category, :category_id
  belongs_to :category

  validates :name, :description, :category, :presence => true

end
