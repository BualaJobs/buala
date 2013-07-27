class Company < ActiveRecord::Base
  attr_accessible :description, :location, :name, :website, :category, :category_id, :company_type, 
    :company_type_id
  belongs_to :category
  belongs_to :company_type

  validates :name, :description, :category, :company_type, :presence => true

end
